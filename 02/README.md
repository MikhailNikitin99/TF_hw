## Задание 1  
Исправил требуемую <b>версию</b> terraform ~>1.12.0 на >1.12.0  
  
<b>platform_id</b> сменил с standart-v4 на standard-v3, так при standart-v4 у меня выходила ошибка: ```Platform "standart-v4" not found```
и затем из-за ```the specified core fraction is not available on platform "standard-v3"; allowed core fractions: 20, 50, 100``` исправил на standard-v1, тк там можно выставить долю ЦПУ в 5%. И увеличил количество ядер c 1 до 2, так как на этой платформе минимально их может быть 2.  
#### Скриншоты с Yandex Cloud и curl ip-адреса:  
<img width="540" height="901" alt="ip in yc" src="https://github.com/user-attachments/assets/267617e4-34d4-4ed4-9f1c-0308101c5ae9" />  

<img width="469" height="47" alt="curl ip" src="https://github.com/user-attachments/assets/04a661e5-35fb-49ce-a3a5-864b4798b35f" />
  
```preemptible = true``` и ```core_fraction=5``` позволяют экономить ресурсы, гранты.  
```preemptible = true``` помогает, если забыл удалить или остановить ВМ, так как с этим флагом сама ВМ остановится через 24 часа, плюс с рациональной точки зрения ВМ нужна не для работы 24/7, а для выполнения заданий.  
```core_fraction = 5``` в основном помогает в экономии средств, плюс для учебных задач (nginx, скрипты, терраформ) много цпу и не нужно.  

## Задание 2  
Все в [main.ft](https://github.com/MikhailNikitin99/TF_hw/blob/main/02/main.tf) и [variables.tf](https://github.com/MikhailNikitin99/TF_hw/blob/main/02/variables.tf)  

#### После добавления переменных:  
<img width="1058" height="591" alt="Добавил переменые" src="https://github.com/user-attachments/assets/3f33353f-6ade-453b-9405-8348185fffa7" />  

## Задание 3
[vms_platform.tf](https://github.com/MikhailNikitin99/TF_hw/blob/main/02/vms_platform.tf)

## Задание 4
#### Вывод ```terrafrom output```:  
<img width="925" height="377" alt="tf_output" src="https://github.com/user-attachments/assets/071dd99c-9325-487e-bf4a-b6e491747d66" />  

## Задание 5
[local.tf](https://github.com/MikhailNikitin99/TF_hw/blob/main/02/locals.tf)  
  
## Задание 6  
Блок ```VM resources``` в [variables.tf](https://github.com/MikhailNikitin99/TF_hw/blob/main/02/variables.tf) и значения в [terraform.tfvars]()  

## Задание 7  
#### Команды и вывод из terraform console
<img width="1843" height="349" alt="7 задание" src="https://github.com/user-attachments/assets/a1a4b5f6-a799-4256-8bc2-9a04ce08c5fa" />  

## Задание 8  
```hcl
variable "test" {
   type = list(map(list(string)))
}

"${local.test[0].dev1[0]}" # команда в консоли 
```

## Задание 9  
<img width="1084" height="661" alt="карта сети" src="https://github.com/user-attachments/assets/a9118a4f-f400-4372-892e-35e89f2a238a" />  

<img width="1032" height="523" alt="web_vm_nat" src="https://github.com/user-attachments/assets/6e7cd02a-02f4-47c3-b315-bea017b1437a" />  

<img width="1035" height="542" alt="db_vm_nat" src="https://github.com/user-attachments/assets/f708cf21-ceec-4608-81ea-b9ae4b076de3" />





