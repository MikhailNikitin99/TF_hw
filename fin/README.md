<img width="1707" height="698" alt="Working_pic" src="https://github.com/user-attachments/assets/b40ec38a-82c6-4e38-bda3-1ab8907996f0" />

<img width="1157" height="839" alt="Infra" src="https://github.com/user-attachments/assets/71c207ce-46e4-43fd-b072-4c15354c08f5" />
  
<img width="1029" height="453" alt="infra_map" src="https://github.com/user-attachments/assets/44bad7e9-e1bc-43b7-a898-b4f6eb639674" />

<img width="827" height="620" alt="cl2" src="https://github.com/user-attachments/assets/ded9e87a-f04d-4381-b5fa-4a75fadb1d48" />
  
<img width="707" height="230" alt="cl1" src="https://github.com/user-attachments/assets/49eb3cfd-0606-4bba-9380-ab719ff22669" />  
  
<img width="1790" height="205" alt="vm" src="https://github.com/user-attachments/assets/8da47c94-c1ae-4e18-a581-379e9dda8239" />  
  
<img width="1125" height="376" alt="repo" src="https://github.com/user-attachments/assets/4c3b874a-f993-4837-8a3f-59afc3539c7f" />  

<img width="1556" height="257" alt="lockbox" src="https://github.com/user-attachments/assets/e6563f1e-9325-4516-95ca-5d02fe3ded1b" />  

<img width="973" height="465" alt="nginx_log" src="https://github.com/user-attachments/assets/52ade028-7d0f-41e4-97bb-cf77ebf6d11e" />  

<img width="803" height="408" alt="reses" src="https://github.com/user-attachments/assets/02d9b3e3-2e53-4114-9893-e87aaf9761fd" />
  

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >1.12.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >=3.9.0 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >=0.228.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_container_registry"></a> [container\_registry](#module\_container\_registry) | ./container_registry | n/a |
| <a name="module_lockbox"></a> [lockbox](#module\_lockbox) | ./lockbox | n/a |
| <a name="module_mysql_cluster"></a> [mysql\_cluster](#module\_mysql\_cluster) | ./mysql_cluster | n/a |
| <a name="module_mysql_db"></a> [mysql\_db](#module\_mysql\_db) | ./mysql_db | n/a |
| <a name="module_vm"></a> [vm](#module\_vm) | ./vm | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_MySQL_User_Password"></a> [MySQL\_User\_Password](#input\_MySQL\_User\_Password) | Password for db's user | `string` | n/a | yes |
| <a name="input_app_path"></a> [app\_path](#input\_app\_path) | path to app foulder | `string` | n/a | yes |
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | n/a | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | ##common vars | `string` | n/a | yes |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | n/a | `string` | n/a | yes |
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id | `string` | n/a | yes |
| <a name="input_db_port"></a> [db\_port](#input\_db\_port) | n/a | `number` | `3306` | no |
| <a name="input_db_table_name"></a> [db\_table\_name](#input\_db\_table\_name) | cloud-init env group variable "db\_host"         { type = string } variable "db\_name"         { type = string } variable "db\_username"         { type = string } variable "db\_password"     { type = string sensitive = true } | `string` | n/a | yes |
| <a name="input_default_cidr"></a> [default\_cidr](#input\_default\_cidr) | https://cloud.yandex.ru/docs/vpc/operations/subnet-create | `list(string)` | <pre>[<br/>  "10.0.1.0/24"<br/>]</pre> | no |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | `"ru-central1-a"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id | `string` | n/a | yes |
| <a name="input_http_cidr"></a> [http\_cidr](#input\_http\_cidr) | list of cidr for http port 80 | `list(string)` | n/a | yes |
| <a name="input_https_cidr"></a> [https\_cidr](#input\_https\_cidr) | list of cidr for ssh port 443 | `list(string)` | n/a | yes |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | tag of Docker image | `string` | `"latest"` | no |
| <a name="input_nat"></a> [nat](#input\_nat) | VM's NAT | `bool` | n/a | yes |
| <a name="input_platform_id"></a> [platform\_id](#input\_platform\_id) | platform\_id | `string` | n/a | yes |
| <a name="input_sa_name"></a> [sa\_name](#input\_sa\_name) | Name of Service Account for Container Registry | `string` | n/a | yes |
| <a name="input_ssh_cidr"></a> [ssh\_cidr](#input\_ssh\_cidr) | list of cidr for ssh port 22 | `list(string)` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | VM's name | `string` | n/a | yes |
| <a name="input_vm_os_family"></a> [vm\_os\_family](#input\_vm\_os\_family) | OS image family | `string` | n/a | yes |
| <a name="input_vm_res"></a> [vm\_res](#input\_vm\_res) | Resources for VM | <pre>object({<br/>    cores = number<br/>    memory = number<br/>    core_fraction = number<br/>    size = number<br/>    type = string<br/>  })</pre> | n/a | yes |
| <a name="input_vm_web_is_preemp"></a> [vm\_web\_is\_preemp](#input\_vm\_web\_is\_preemp) | Is VM stoppable or not? | `bool` | `true` | no |
| <a name="input_vms_ssh_root_key"></a> [vms\_ssh\_root\_key](#input\_vms\_ssh\_root\_key) | ssh-keygen -t ed25519 | `string` | `"your_ssh_ed25519_key"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC network&subnet name | `string` | `"develop"` | no |

## Outputs

No outputs.
