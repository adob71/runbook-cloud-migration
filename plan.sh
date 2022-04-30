#!/bin/bash

plan/ff -o plan/$1.pddl -f plan/$2.pddl > log/$2_planned.txt

grep '[0-9]:' log/$2_planned.txt > log/$2_planned_tasks.txt

sed -i "s/step /     /g;s/\(.*\)/\L\1/" log/$2_planned_tasks.txt

t=$(date +"%Y%m%d%H%M%S")

cp log/$2_planned_tasks.txt log/$2_planned_tasks_$t.txt

netstat -t --wide > log/$2_planned_tasks_$t.log
