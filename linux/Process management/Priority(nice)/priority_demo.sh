#!/bin/bash
nice -n 15 sleep 300 &
PID=$!
echo "Запущен процесс PID: $PID с приоритетом (nice): $(ps -o ni= $PID)"
sudo renice -n 5 $PID && echo "Приоритет процесса изменен"
echo "Новый приоритет (nice): $(ps -o ni= $PID)"
kill $PID && echo "Процесс завершен"
