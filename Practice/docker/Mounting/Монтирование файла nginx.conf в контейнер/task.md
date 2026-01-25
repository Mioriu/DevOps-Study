Type: Task
Priority: High
Assignee: [Твое имя]
Summary: Создать кастомный образ веб-приложения на основе nginx с возможностью горячей замены конфигурации
Description:
1. Создай директорию проекта `my-nginx-app`.
2. Внутри неё создай файл `index.html` с простым содержимым (например, "<h1>Мой кастомный сайт</h1>").
3. Создай файл `nginx-custom.conf` с кастомной конфигурацией nginx:
   - Установи корень документа (root) в `/usr/share/nginx/html`
   - Добавь опцию `sendfile off;` (для работы в Docker-среде)
   - Можешь добавить любую другую простую настройку (например, `server_tokens off;`)

4. Напиши Dockerfile, который:
   - Базовый образ: `nginx:alpine`
   - Копирует твой `index.html` в стандартную папку контента nginx
   - Копирует твой `nginx-custom.conf` в `/etc/nginx/conf.d/default.conf` (заменяя дефолтный)
   - Открывает порт 80
   - Использует инструкцию CMD для запуска nginx

5. Собери образ с тегом `my-nginx-app:v1`.

6. Запусти контейнер из этого образа:
   - В фоновом режиме
   - С именем `custom_nginx`
   - С пробросом порта 8080 на хосте на порт 80 контейнера
   - Смонтируй том (bind mount) так, чтобы файл `nginx-custom.conf` на хосте (в директории проекта) был смонтирован в контейнер по тому же пути (`/etc/nginx/conf.d/default.conf`)

7. Проверь, что:
   - Контейнер запущен
   - Сайт доступен по `localhost:8080` и показывает твой кастомный `index.html`
   - Изменение `nginx-custom.conf` на хосте (например, добавь `server_name localhost;`) приводит к применению конфигурации без перезапуска контейнера (проверь через `docker exec` или перезагрузи nginx внутри контейнера)

Ограничения:
- Не используй готовые конфиги из интернета — пиши минимальные рабочие версии.
- Для монтирования тома используй `-v` или `--mount`.


Решение:
1) cat Dockerfile  index.html  nginx-custom.conf
FROM nginx:alpine
COPY index.html /usr/share/nginx/html
COPY nginx-custom.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
<h1>Мой кастомный сайт</h1>
server {
        listen 80;
        root /usr/share/nginx/html;
        server_name localhost;
        index index.html;

        sendfile off;
        server_tokens off;

        location / {
                try_files $uri $uri/ =404;
        }
}
2) docker build -t my-nginx-app:v1 .
docker run -d --name=custom_nginx -v $(pwd)/nginx-custom.conf:/etc/nginx/conf.d/default.conf -p 8080:80 my-nginx-app:v1
3) docker ps
CONTAINER ID   IMAGE             COMMAND                  CREATED         STATUS         PORTS                                     NAMES
ed9fdda6bf2c   my-nginx-app:v1   "/docker-entrypoint.…"   6 minutes ago   Up 6 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   custom_nginx
root@DESKTOP-14S1ENM:~/my-nginx-app# curl localhost:8080
<h1>Мой кастомный сайт</h1>
docker exec custom_nginx cat /etc/nginx/conf.d/default.conf

Ответы на вопросы:
Проверочные вопросы:
Безопасность и эффективность образа:
1) Ты использовал nginx:alpine — это хороший выбор. А почему в Dockerfile ты добавил строку CMD ["nginx","-g","daemon off;"]? Это важно для работы контейнера? (Подсказка: посмотри, какая команда по умолчанию выполняется в базовом образе nginx:alpine через docker history или в документации).
- Добавил т.к. требовалось по заданию, по факту можно не добавлять потому что она установлена  по умолчанию в базовом образе nginx:alpine. Нужна она для запуска nginx фоновым процессом, для исключения отработки и остановки службы

Корректность монтирования томов:
2) Команда docker run -d --name custom_nginx -v $(pwd)/nginx-custom.conf:/etc/nginx/conf.d/default.conf -p 8080:80 my-nginx-app:v1 смонтировала файл напрямую (bind mount). Что произойдёт, если при запуске контейнера файл nginx-custom.conf на хосте не существует? А если это будет директория вместо файла?
- Если файл на хосте не существует, Docker создаст его как директорию (при использовании -v). Это может сломать конфигурацию, т.к. nginx ожидает файл, а получает папку.
Если указать путь к директории вместо файла — произойдёт монтирование директории, что тоже может привести к ошибкам (внутри контейнера будет директория вместо файла конфига).
Вывод: При bind mount файлов важно, чтобы путь на хосте вёл к существующему файлу (для файлового монтирования).

 Жизненный цикл контейнера и конфигурация:
3) Ты смонтировал конфиг как том. Если теперь изменить nginx-custom.conf на хосте (например, добавить client_max_body_size 10m;), как применить изменения внутри контейнера без его перезапуска? Приведи команду.
- docker exec custom_nginx nginx -s reload

Взаимодействие слоёв образа и тома:
4) В Dockerfile ты скопировал nginx-custom.conf в /etc/nginx/conf.d/default.conf. Но при запуске ты перезаписал этот файл через bind mount. Получается, что копирование в образе стало бесполезным? Зачем тогда копировать файл в образ, если он всё равно заменяется при монтировании?
- Мы можем запустить из этого образа еще кучу контейнеров, но уже с другими правилами и параметрами, например без монтирования, тогда нам будет нужен этот кастомный конфиг

Проверка монтирования:
5) Какой командой ты можешь убедиться, что файл /etc/nginx/conf.d/default.conf внутри контейнера действительно привязан к файлу на хосте, а не лежит в слоях образа? Покажи команду и её вывод.
- docker inspect custom_nginx | grep -A 10 "Mounts"
        "Mounts": [
            {
                "Type": "bind",
                "Source": "/root/my-nginx-app/nginx-custom.conf",
                "Destination": "/etc/nginx/conf.d/default.conf",
                "Mode": "",
                "RW": true,
                "Propagation": "rprivate"
            }