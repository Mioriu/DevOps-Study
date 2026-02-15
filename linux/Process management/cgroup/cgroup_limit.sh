#!/bin/bash
mkdir /sys/fs/cgroup/test_group
sudo echo $((100*1024*1024)) > /sys/fs/cgroup/test_group/memory.max
sleep 200 &
PID=$!
echo $PID > /sys/fs/cgroup/test_group/cgroup.procs
MEM=$(cat /sys/fs/cgroup/test_group/memory.current)
echo "Создана cgroup test_group с лимитом 100МБ памяти Запущен процесс с PID: $PID и добавлен в cgroup Текущее использование памяти cgroup: $MEM байт"
