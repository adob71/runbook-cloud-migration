<?php
//(c) runbook.expert

$runbook_move_server_rack_to_rack_problem_init_file="execute/" . $argv[1] . ".init";
$runbook_move_server_rack_to_rack_problem = file($runbook_move_server_rack_to_rack_problem_init_file);
foreach ($runbook_move_server_rack_to_rack_problem as $runbook_move_server_rack_to_rack_line_number => $runbook_move_server_rack_to_rack_line) 
{
   $runbook_move_server_rack_to_rack_array[$runbook_move_server_rack_to_rack_line_number] = preg_split('//', $runbook_move_server_rack_to_rack_line, -1, PREG_SPLIT_NO_EMPTY);
}

//system('clear');
foreach ($runbook_move_server_rack_to_rack_array as $runbook_move_server_rack_to_rack_line) 
{
   $runbook_move_server_rack_to_rack_line_output=implode("",$runbook_move_server_rack_to_rack_line);
   echo $runbook_move_server_rack_to_rack_line_output;
}
//sleep(1);

$runbook_move_server_rack_to_rack_problem_planned_tasks_file = "log/" . $argv[1] . "_planned_tasks.txt";
$problem_planned_tasks = file($runbook_move_server_rack_to_rack_problem_planned_tasks_file);
foreach ($problem_planned_tasks as $task_number => $task)
{
   $task_parameter = preg_split("/[\s]+/", $task);

   $tp3=(int) filter_var($task_parameter[3], FILTER_SANITIZE_NUMBER_INT);
   $tp4=(int) filter_var($task_parameter[4], FILTER_SANITIZE_NUMBER_INT);
   $tp5=(int) filter_var($task_parameter[5], FILTER_SANITIZE_NUMBER_INT);
   $tp6=(int) filter_var($task_parameter[6], FILTER_SANITIZE_NUMBER_INT);

   switch ($task_parameter[2]) 
   {

      case "move-r":
      $runbook_move_server_rack_to_rack_array[$tp4][$tp3]=".";
      $runbook_move_server_rack_to_rack_array[$tp4][$tp5]="L";
      break;

      case "move-l":
      $runbook_move_server_rack_to_rack_array[$tp4][$tp3]=".";
      $runbook_move_server_rack_to_rack_array[$tp4][$tp5]="L";
      break;

      case "move-d":
      $runbook_move_server_rack_to_rack_array[$tp4][$tp3]=".";
      $runbook_move_server_rack_to_rack_array[$tp5][$tp3]="L";
      break;

      case "move-u":
      $runbook_move_server_rack_to_rack_array[$tp4][$tp3]=".";
      $runbook_move_server_rack_to_rack_array[$tp5][$tp3]="L";
      break;

      case "push-r":
      $runbook_move_server_rack_to_rack_array[$tp4][$tp3]=".";
      $runbook_move_server_rack_to_rack_array[$tp4][$tp5]="L";
      $runbook_move_server_rack_to_rack_array[$tp4][$tp6]="S";
      break;

      case "push-l":
      $runbook_move_server_rack_to_rack_array[$tp4][$tp3]=".";
      $runbook_move_server_rack_to_rack_array[$tp4][$tp5]="L";
      $runbook_move_server_rack_to_rack_array[$tp4][$tp6]="S";
      break;

      case "push-d":
      $runbook_move_server_rack_to_rack_array[$tp4][$tp3]=".";
      $runbook_move_server_rack_to_rack_array[$tp5][$tp3]="L";
      $runbook_move_server_rack_to_rack_array[$tp6][$tp3]="S";
      break;

      case "push-u":
      $runbook_move_server_rack_to_rack_array[$tp4][$tp3]=".";
      $runbook_move_server_rack_to_rack_array[$tp5][$tp3]="L";
      $runbook_move_server_rack_to_rack_array[$tp6][$tp3]="S";
      break;

   }

//   system('clear');
   foreach ($runbook_move_server_rack_to_rack_array as $runbook_move_server_rack_to_rack_line)
   {
      $runbook_move_server_rack_to_rack_line_output=implode("",$runbook_move_server_rack_to_rack_line);
      echo $runbook_move_server_rack_to_rack_line_output;
   }
//   usleep(100000);

}

?>
