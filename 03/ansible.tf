resource "local_file" "ansible_inventory" {
  filename = "./hosts.ini"

  content = templatefile("./hosts.tftpl", {
    web = yandex_compute_instance.web
    db = yandex_compute_instance.db
    storage = [yandex_compute_instance.storage]
  })
}

### 6 task
resource "null_resource" "vm_provision" {
  depends_on = [
    yandex_compute_instance.web,
    yandex_compute_instance.db,
    yandex_compute_instance.storage,
    local_file.ansible_inventory
  ]

  #provisioner "local-exec" {
  #  command = "eval $(ssh-agent) && ssh-add ${local.private_key}"
  #}

  provisioner "local-exec" {
    command = "sleep 60 && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${abspath(path.module)}/hosts.ini ${abspath(path.module)}/test.yml -vvv --private-key=${local.private_key}"
    on_failure  = continue
    environment = { ANSIBLE_HOST_KEY_CHECKING = "False" }
  }
  triggers = {always_run = "${timestamp()}"}
}
