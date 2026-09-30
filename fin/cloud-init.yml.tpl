#cloud-config
users:
  - name: ubuntu
    groups: sudo, docker
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    ssh_authorized_keys:
      - ${ssh_public_key}
package_update: true
package_upgrade: false
packages:
  - nano
  - ca-certificates
  - curl
  - gnupg
  - lsb-release
  - jq
write_files:
  - path: /app/.env
    permissions: "0600"
    content: |
        DB_HOST=${db_host}
        DB_NAME=${db_name}
        DB_USER=${db_user}
        DB_PASSWORD=${db_password}
  - path: /app/compose.yaml
    permissions: "0644"
    content: |
      services:
        web:
          image: cr.yandex/${repository_name}/web-app:latest
          env_file:
            - .env
          restart: on-failure
          networks:
            - app-network
          healthcheck:
            test: ["CMD", "wget","--no-verbose","--tries=1","--spider","http://localhost:5000/"]
            interval: 30s
            timeout: 5s
            star_period: 10s
            retries: 3
        nginx:
          image: nginx:latest
          restart: on-failure
          ports:
            - "80:80"
            - "443:443"
          volumes:
            - ./nginx/ingress/nginx.conf:/etc/nginx/nginx.conf:rw
            - ./nginx/ingress/default.conf:/etc/nginx/conf.d/default.conf:rw
          depends_on:
            web:
              condition: service_healthy
          networks:
            - app-network

      networks:
        app-network:
          driver: bridge
  - path: /app/nginx/ingress/nginx.conf
    permissions: "0644"
    content: |
      user  nginx;
      worker_processes  auto;

      error_log  /var/log/nginx/error.log notice;
      pid        /var/run/nginx.pid;

      events {
          worker_connections  1024;
      }

      http {
          default_type  application/octet-stream;

          log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                            '$status $body_bytes_sent "$http_referer" '
                            '"$http_user_agent" "$http_x_forwarded_for"';

          log_format proxied '$http_x_real_ip - $remote_user [$time_local] '
                              '"$request" $status $bytes_sent '
                              '"$http_referer" "$http_user_agent" "$proxy_add_x_forwarded_for";';

          access_log  /var/log/nginx/access.log  main;

          sendfile        on;
          keepalive_timeout  65;

          include /etc/nginx/conf.d/*.conf;
      }
  - path: /app/nginx/ingress/default.conf
    permissions: "0644"
    content: |
      server {
          listen 80;
          server_name _;

          access_log /var/log/nginx/access.log proxied;

          location / {
              proxy_pass http://web:5000;

              proxy_set_header Host $host;
              proxy_set_header X-Real-IP $remote_addr;
              proxy_set_header X-Forwarded-For $remote_addr;
              proxy_set_header X-Forwarded-Proto $http_x_forwarded_proto;
          }
      }
runcmd:
  - |
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    chmod a+r /etc/apt/keyrings/docker.asc
  - |
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
  - apt-get update
  - apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  - systemctl enable --now docker
  - |
    TOKEN=$(curl -s -H "Metadata-Flavor: Google" "http://169.254.169.254/computeMetadata/v1/instance/service-accounts/default/token" | jq -r '.access_token') && echo "$TOKEN" | docker login --username iam --password-stdin cr.yandex
  - |
    cd /app && docker compose up -d
