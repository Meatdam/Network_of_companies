# Network of companies
_____
Приложение сеть компаний.
Суть приложения:<br>
Пользователь создает компанию. Вводит все данные о компании, так же если у компании нет поставищика, то данная компания стоит в целочки под 0 номером в сети (Завод) 
или компания которая что то производит.
Если у компании есть поставщик, и если это поставщик не зовод, то в цепочки она стоит под level = 2, если поставщик завод то level = 1.
Пользователь может добавлять, удалять, редактировать и просматривать детально только свои продукты, компанию, поставщика. Так же добовлять продукты пользователь может лишь в том случае,
если компания принадлежит ему.

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
Так же отображенны все схемы, которые в приложение присутствуют.
_____
Для запуска проекта у себя локально без Docker необходимо:
1. git clone репозитория
```
git@github.com:Meatdam/key_manager.git
```
2. Установить и инициализировать виртуальное окружение `venv`
```
poetry init
```
3. Создать базу данных в ```PgAdmin```, либо через терминал.
4. Заполнить своими данными файл .env в корне вашего проекта. Образец файла лежит в корне .env.example
5. Для применение миграция выполните команды
```
alembic revision --autogenerate -m "Database creation
```
```
alembic upgrade head
```
6. Для запуска проекта использовать команду
```
uvicorn src.main:app --reload
```
иля запустить проект с файла `main.py`

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
В проекте подключен `git actions` для тестирования кода, линтером `flake8` и библиотекой `pytest`

Автор проекта:<br>
[Кузькин Илья](https://github.com/Meatdam)
