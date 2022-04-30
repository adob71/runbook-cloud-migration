#!/bin/bash

case $1 in

   runbook_move_vm_to_vm)
   php execute/runbook_move_vm_to_vm.php $2 > log/$2_executed_tasks.txt
   ;;

   runbook_move_vm_to_instance)
   php execute/runbook_move_vm_to_instance.php $2 > log/$2_executed_tasks.txt
   ;;

   runbook_move_vm_to_container)
   php execute/runbook_move_vm_to_container.php $2 > log/$2_executed_tasks.txt
   ;;

   runbook_move_vm_to_serverless_code)
   php execute/runbook_move_vm_to_serverless_code.php $2 > log/$2_executed_tasks.txt
   ;;

   runbook_move_vm_to_serverless_container)
   php execute/runbook_move_vm_to_serverless_container.php $2 > log/$2_executed_tasks.txt
   ;;

   runbook_move_server_rack_to_rack)
   php execute/runbook_move_server_rack_to_rack.php $2 > log/$2_executed_tasks.txt
   ;;

   *)
   ;;
   
esac

t=$(date +"%Y%m%d%H%M%S")

cp log/$2_executed_tasks.txt log/$2_executed_tasks_$t.txt

netstat -t --wide > log/$2_executed_tasks_$t.log
