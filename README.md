# Network of companies
_____
Приложение `"сеть компаний."`<br>
Суть приложения:<br>
Пользователь создает компанию. Вводит все данные о компании, так же если у компании нет поставищика, то данная компания стоит в целочки под `0`-вым номером в сети (Завод) 
или компания которая что то производит.
Если у компании есть поставщик, и этот поставщик не зовод, то в цепочки она стоит под `level = 2`, если поставщик завод то `level = 1`.<br>
`Пользователь` может добавлять, удалять, редактировать и просматривать детально только свои продукты, компанию, поставщика. Так же, добовлять продукты пользователь может лишь в том случае,
если компания принадлежит ему.<br>
Приложение покрыто `unittest`-ами, покрытие составило 87%.<br>
Код проверен на соответствие `pep8`, линтером `flake8`.

_____

Приложение выполнено на Django REST framework<br>
## Стек:<br>
- Django;
- DRF
- PostgreSQL;
- Swagger;
- redoc;
- psycopg2-binary;
- Dockefile;
- docker-compose;
- unittest.
_____
Данное приложение работает на взаимодействие API.<br>
Подkлючена документация swagger, redoc<br> 
Так же отображенны все схемы, которые в приложении присутствуют.
_____

Для запуска проекта без использования Docker необходимо сделать 
1. git clone репозитория
```
git@github.com:Meatdam/online_traning_LMS_system.git
```
2. Установить виртуальное окружение `venv`
```
python3 -m venv venv для MacOS и Linux систем
python -m venv venv для windows
```
3. Активировать виртуальное окружение
```
source venv/bin/activate для MasOs и Linux систем
venv\Scripts\activate.bat для windows
```
4. установить файл с зависимостями
```
pip install -r requirements.txt
```
4. Создать базу данных в ```PgAdmin```, либо через терминал. Необходимо дать название в файле settings.py в каталоге 'base' в константе (словаре) 'DATABASES'

5. Создать в корне проекта файл `.env` и заполнить его данными из файла `.env.example`
_____
Запуск приложения через Docker:<br>
1. Повторить шаги 1-3
2. Запустить Docker локально на машине
3. Выполнить команду в терминале
```
docker compose up -d --build
```
Данная команда сразу создаст образ, и сбилдит его, т.е. запустит локально в Docker<br>
4. Переходим по ссылке ```http://localhost:8000/```<br>
_____
Чтобы удалить контейнеры после работы с приложением используйте команду 
```
docker-compose down 
```
_____

Автор проекта:<br>
[Кузькин Илья](https://github.com/Meatdam)

