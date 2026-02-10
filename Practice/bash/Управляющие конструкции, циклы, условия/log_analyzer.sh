#!/bin/bash
LOGS=$(cat ./logs/sample.log)
ERRORCNT=0
INFOCNT=0
WARNCNT=0
for line in $LOGS;
do
 if [[ $line =~ ^ERROR ]]; then
    ((ERRORCNT++))
 elif [[ $line =~ ^INFO ]]; then
    ((INFOCNT++))
 elif [[ $line =~ ^WARNING ]]; then
    ((WARNCNT++))
fi
done
declare -A stats
stats["INFO"]="$INFOCNT"
stats["WARNING"]="$WARNCNT"
stats["ERROR"]="$ERRORCNT"
echo "Анализ лога завершен:" && echo
for key in ${!stats[@]};
do
  echo "$key: ${stats[$key]}"
done
