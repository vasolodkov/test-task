# test task

Скрипт запускается без параметров.

### Описание работы

- находятся и удаляются старые файлы переменных окружения и docker-compose.yml
- во всех каталогах с микросервисами находятся файлы docker-compose и .env
- формируется предварительная команда для генерации итогового docker-compose.yml
- обходятся все файлы с переменными окружения, сравниваются с prod.json
- недостающие параметры добавляются в итоговый файл .env.prod
- формируется окончательная команда для генерации итогового docker-compose.yml
- запускается команда и формируется docker-compose.yml

Вариант по улучшению и оптимизации - использовать override механизм.