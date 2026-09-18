## Задание 1  
### Проверки на ошибки  

<img width="1492" height="348" alt="tflint_04_src" src="https://github.com/user-attachments/assets/383f86c7-1b80-4186-8233-7ec5dd1dde80" />
<img width="1547" height="626" alt="tflint_04_demo_01" src="https://github.com/user-attachments/assets/170810df-82ba-43ed-9702-bab8ada0dc08" />
<img width="1492" height="576" alt="tflint_04_demo_02" src="https://github.com/user-attachments/assets/14f61b64-4bfc-4902-8d9e-4ab73f963e5d" />  

<img width="817" height="477" alt="checkov_04_src_01" src="https://github.com/user-attachments/assets/743b9490-ccbd-4323-a2d3-88bca71098ca" />
<img width="1041" height="785" alt="checkov_04_src_02" src="https://github.com/user-attachments/assets/2c79d6a5-3427-4cf0-8527-162855c5ad07" />
<img width="1229" height="799" alt="checkov_04_demo_01" src="https://github.com/user-attachments/assets/2e0eba09-f29d-4027-b84b-0a80e932bc86" />
<img width="1248" height="792" alt="checkov_04_demo_02" src="https://github.com/user-attachments/assets/0a6765f6-5f8d-46d1-ac07-2b534175f299" />
<img width="1326" height="661" alt="checkov_04_demo_03" src="https://github.com/user-attachments/assets/a90a05ed-2ab3-4a00-9f65-ea79a2b65372" />
<img width="1282" height="782" alt="checkov_04_demo_04" src="https://github.com/user-attachments/assets/3e945fc1-c0a8-4975-b2f9-b7b943f13cb3" />  

### Типы ошибок  

- Использование интерполяции строк для передачи переменных или ссылок (Interpolation-only expressions are deprecated in tf v.0.12.14)  
- Не указана версия провайдера (Missing version constraint for provider)  
- Переменная объявлена, но не использована (Variable is declared but not used)  
- Модуль использует main как дефолтную ветку без указаний конкретного коммита или тега, подтягивая всегда самую последнюю версию (Module source uses a default branch as ref (main))  
- Провайдер не объявлен и его версия не указана(Missing varsion constraint for provider in 'required_modules')  
- В кластер БД нет создания или присоединения к  группе безопасности  
- Высокая энтропия(токен и пароль от vault переданы в явном виде)  
- Compute Instance имеет публичный IP  
- Группа безопасности не назначена сетевому интерфейсу  
  
## Задание 2  

<img width="1022" height="763" alt="01" src="https://github.com/user-attachments/assets/f99e6022-1bb3-4e77-99b6-fc929cc84b19" />  
<img width="1045" height="620" alt="02" src="https://github.com/user-attachments/assets/5e198ee5-b58c-4b9c-ab9d-2bead7d46290" />
<img width="735" height="304" alt="03" src="https://github.com/user-attachments/assets/4812e16b-41b6-4c0a-886f-0cbe0904da8e" />  
  
### Блокировка state(console не блокирует теперь state(как в лекции и обнаружилось кстати, ну и я убедился в этом тоже), поэтому вместо консоли вызвал `terraform apply`)
<img width="1544" height="703" alt="Блокировка стейта" src="https://github.com/user-attachments/assets/f0771188-4e47-4cef-a04a-489d656c2172" />  
  
### Разлокировка state  
  
<img width="742" height="377" alt="Разблокировка стейта принудительно" src="https://github.com/user-attachments/assets/6d9b0207-8750-4608-a6c6-d41ad9e5bb81" />

## Задание 3
[Ссылка на PR с изменениями](https://github.com/MikhailNikitin99/TF_hw/pull/1)
