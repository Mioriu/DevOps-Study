Продвинутая работа с gzip, bzip2, xz и zip
В этом задании вы углубите навыки работы с разными алгоритмами сжатия (gzip, bzip2, xz и zip) и потренируетесь управлять параметрами сжатия, частично извлекать данные из архивов, а также комбинировать эти методы. Выполните задачи последовательно и предоставьте отчёт в виде списка команд, которые использовали.

1) Подготовка рабочей среды
Создайте каталог compression_advanced и перейдите в него.
Создайте внутри каталоги и файлы:
Каталог logs, внутри файлы: app.log и error.log с произвольным текстом.
Каталог configs, внутри файлы: app.conf и db.conf с произвольным текстом.
Файл notes.md с текстом: "# Мои заметки"
2) Сжатие с разными уровнями компрессии (gzip)
Сожмите файл notes.md с максимальной скоростью сжатия (быстрое сжатие).
Зафиксируйте размер файла.
Распакуйте его и повторно сожмите, но теперь с максимальным уровнем компрессии (максимальное сжатие).
Сравните и запишите разницу в размерах между двумя способами.
3) Сжатие и распаковка директории (zip)
Создайте ZIP-архив configs_backup.zip с каталогом configs рекурсивно.
Удалите каталог configs и распакуйте только один файл db.conf из созданного архива обратно в каталог configs.
Проверьте, что файл восстановлен, а app.conf отсутствует.
4) Сжатие каталога с помощью tar и bzip2
Создайте tar-архив с bzip2-сжатием (logs_backup.tar.bz2), включающий в себя каталог logs.
Просмотрите содержимое созданного архива без его распаковки.
Удалите каталог logs, затем извлеките из архива обратно только файл error.log.
Проверьте, что извлечён только нужный файл.
5) Работа с форматом xz
Создайте копию файла notes.md под именем notes_copy.md.
Сожмите notes_copy.md с помощью xz, сохранив при этом исходный файл.
Проверьте, что теперь существуют оба файла: оригинал и сжатый .xz.
Распакуйте сжатый файл обратно.
Итоговый отчёт (список команд)
Отправьте полный список команд, использованных вами для выполнения всех пунктов задания, включая проверочные шаги.

Пример отчёта:
mkdir compression_advanced
cd compression_advanced
mkdir logs configs
echo "Log started" > logs/app.log
...
(далее ваш полный список команд)

# Решение
mkdir compression_advanced && cd compression_advanced 
mkdir logs && echo "text1" >> ./logs/app.log && echo "error1" >> ./logs/error.log
mkdir configs && echo "appConf" >> ./configs/app.conf && echo "dbConf" >> ./configs/db.conf
echo "# Мои заметки" >> notes.md
gzip -1 notes.md
du -sh notes.md.gz
gunzip notes.md.gz && gzip -9 notes.md
du -sh notes.md.gz
zip -r configs_backup.zip configs/
rm -rf configs
unzip configs_backup.zip configs/db.conf
ls -l configs
tar -cjvf logs_backup.tar.bz2 logs/
tar -tf logs_backup.tar.bz2
rm -rf logs
tar -xvf logs_backup.tar.bz2 logs/error.log
ls -l logs
cp notes.md notes_copy.md
xz notes_copy.md -k
ls -l
unxz notes_copy.md.xz