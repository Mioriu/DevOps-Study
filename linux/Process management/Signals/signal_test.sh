#!/bin/bash
PID=$( (sleep 300 > /dev/null 2>&1 & echo $!) )
echo "Запущен процесс с PID: $PID"
kill -19 $PID && echo "Процесс остановлен"
sleep 2
kill -18 $PID && echo "Процесс возобновлен"
sleep 2
kill -15 $PID && echo "Процесс завершен"
