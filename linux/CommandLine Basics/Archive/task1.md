Сжатие и распаковка файлов (gzip, bzip2, xz, zip)
В этой практике вы потренируетесь сжимать и распаковывать файлы с помощью утилит gzip, bzip2, xz и zip, а также познакомитесь с их особенностями. Выполните указанные шаги последовательно и предоставьте отчёт в виде полного списка команд.

1) Подготовка рабочей среды
Создайте каталог compression_lab и перейдите в него.
Создайте три файла со следующим содержимым:
report.txt — текст: "Отчёт за сегодня"
data.csv — текст: "id,value\n1,100\n2,200"
logfile.log — текст: "Error: Something went wrong!"
2) Сжатие и распаковка файла (gzip)
Сожмите файл report.txt с помощью утилиты gzip.
Проверьте, что исходный файл заменился на report.txt.gz.
Распакуйте обратно report.txt.gz, используя команду распаковки gunzip.
Проверьте, что файл вернулся к исходному состоянию.
3) Сжатие файла с помощью bzip2 (без удаления оригинала)
Сожмите файл data.csv утилитой bzip2, используя ключ для сохранения оригинального файла.
Убедитесь, что теперь в каталоге есть оба файла: исходный и сжатый (data.csv.bz2).
Распакуйте файл обратно с помощью команды bunzip2.
4) Сжатие файла с помощью xz
Сожмите файл logfile.log с помощью утилиты xz.
Проверьте, что файл заменился на logfile.log.xz.
Распакуйте обратно с помощью команды unxz.
5) Создание и распаковка ZIP-архива с каталогом
Создайте архив archive.zip, включающий все текущие файлы (report.txt, data.csv, logfile.log).
Удалите файлы из текущего каталога и распакуйте archive.zip обратно.
Проверьте, что все файлы восстановлены.
Итоговый отчёт (список команд)
Отправьте полный список команд, которые вы использовали при выполнении всех шагов задания, включая проверочные команды.

Пример отчёта:
mkdir compression_lab
cd compression_lab
echo "Отчёт за сегодня" > report.txt
...
(далее ваш полный список команд)


Решение:
mkdir compression_lab && cd compression_lab
echo "Отчёт за сегодня" >> report.txt
echo "id,value\n1,100\n2,200" >> data.csv
echo "Error: Something went wrong!" >> logfile.log
gzip report.txt
ls -l
gunzip report.txt.gz
ls -l
cat report.txt
bzip2 data.csv -k
ls -l
bunzip2 data.csv.bz2
xz logfile.log
ls -l
unxz logfile.log.xz
zip -r archive.zip .
rm data.csv logfile.log report.txt
unzip archive.zip
ls