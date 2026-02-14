#!/bin/bash
ps -eo pid,comm,%mem --sort=-%mem | awk 'NR==2 {printf "PID: %s | Процесс: %s | Память:%s%\n",$1,$2,$3}'
