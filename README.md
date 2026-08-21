# Домашнее задание к занятию «Введение в Terraform»
### Версия Terraform:  
<img width="526" height="89" alt="Версия тф" src="https://github.com/user-attachments/assets/0402e007-aad0-4454-8188-08e22e4d5f9a" />  
  
### Скачивание зависимостей:  
<img width="1452" height="822" alt="Скачивание_зависимостей" src="https://github.com/user-attachments/assets/3c85c2ea-dd42-4265-bd84-2b8f870a6815" />  

### Секреты хранятся в <b>personal.auto.tfvars</b>  

### Результат random_password:
<img width="841" height="867" alt="рандом_пас_результат" src="https://github.com/user-attachments/assets/4ef35cf5-f8d0-46d2-a8b5-c67ba52c3d66" />  
  
### Исправленный main.tf (места исправления выделены):  
<img width="593" height="743" alt="исправленный main" src="https://github.com/user-attachments/assets/72b990fe-fc73-4e9a-9ce3-de67ec7b6df9" />  

В блоке:
```hcl
resource "docker_image" {
  name         = "nginx:latest"
  keep_locally = true
}
```
Пропущено имя ресурса: resource "docker_image" <b>"какое-то имя"</b>

В блоке:
```hcl
resource "docker_container" "1nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string_FAKE.resulT}"

  ports {
    internal = 80
    external = 9090
  }
```
Название начинается с цифры, terraform говорит о том, что название должно начинаться с буквы или "_".  
Также в аргументе <b><i>"name  = "example_${random_password.random_string_FAKE.resulT}""</i></b> используется большая "Т" в result, поэтому terraform не находит такого в root_module.  
Там же название ресурса <b>"random_string_FAKE"</b> не соответствует реальному названию блока random_password, которое <b>"random_string"</b>.  

### Поднятый  контейнер:  
<img width="1203" height="558" alt="Поднятый контейнер с nginx" src="https://github.com/user-attachments/assets/7e7a9904-63c8-40ed-a6ce-1e13cda45fdb" />  

### Смена имени контейнера на "hello_world":  
<img width="994" height="736" alt="изменил имя на hello_world" src="https://github.com/user-attachments/assets/08a1c430-35f2-4cc3-ba0f-301c8d27967b" />  

### Чем опасен ключ -auto-approve:  
Ключ -auto-approve убирает <b>интерактивность</b>, т.е. terrafrom <b>не</b> спрашивает подтверждения и сразу меняет конфигурацию. Нет контроля над тем, что будет меняться.  
Скорее всего этот ключ будет уместен в CI/CD для авторазвертывания тестовой инфраструктуры.  

### .tfstate после terraform destroy:  
<img width="585" height="170" alt="tfstate после tf destroy" src="https://github.com/user-attachments/assets/6c360fbd-9341-4e44-9425-716176a2a5a4" />  

### Почему докер-образ не удалился после terraform destroy:  
в блоке с докером:
```hcl
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}
```
Есть аргумент <b>"keep_locally"</b> с true, что означает то, что образ <b>не будет удален при terraform destroy</b>. Если бы стоял false, то образ бы удалился:
```md
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.
```

## Задание 2  
### [код в main.tf](https://github.com/MikhailNikitin99/TF_hw/blob/main/main.tf)  
Вывод <b>env</b> с контейнера MySQL:  
<img width="890" height="472" alt="задание с бд" src="https://github.com/user-attachments/assets/be65c2ef-69f3-4207-a652-e858eaed9520" />  

## Задание 3
Вариант с Opentofu (для доступа к зеркалу создал .tofurc ):  
<img width="793" height="779" alt="вариант с opentofu" src="https://github.com/user-attachments/assets/346079df-7af0-45c7-b21e-13d5d9d6f168" />  





