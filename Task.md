# Тестовое задание

Программисты пишут микросервисы и складывают docker-compose файлы и .env файлы в папку с названием микросервиса. Для локального развертывания микросервиса достаточно выполнить команду docker-compose up -d в папке каждого микросервиса. В .env файлах хранятся переменные для dev окружения. Программисты периодически добавляют в .env и docker-compose файлы новые переменные. Задача devOps выкатить микросервисы на прод с минимальными трудозатратами. Для этого было принято решение хранить переменные для прода в json формате. 

Задача: 

- Написать скрипт который

  - Обходит папки с микросервисами и собирает все docker-compose файлы в  один docker-compose файл
  - Анализирует json файл с переменными для прода и выдает каких переменных не хватает и какие лишние (на основании только docker-compose файлов в простейшем случае, с учетом .env в усложненном)
  - В случае если переменных достаточно подставляет переменные для прода в итоговый docker-compose файл

  Скрипт должен работать на Linux и Windows поэтому для кроссплатформенности его надо упаковать в docker и запускать через docker run или bash скриптом (на windows для этого можно использовать git bash). Допустимые языки программирования python, bash.

  Результат представить в виде репозитория на GitHub

Приветствуется:

- Описание как все работает и инструкция по запуску
- Описание почему сделано именно так, что можно было бы улучшить
- Мысли по поводу того как можно было оптимизировать всю работу