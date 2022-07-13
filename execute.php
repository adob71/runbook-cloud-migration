<!DOCTYPE html>
<html>

   <head>

   <!-- Global site tag (gtag.js) - Google Analytics -->
   <script async src="https://www.googletagmanager.com/gtag/js?id=G-C106WXP1NR"></script>
   <script>
     window.dataLayer = window.dataLayer || [];
     function gtag(){dataLayer.push(arguments);}
     gtag('js', new Date());

     gtag('config', 'G-C106WXP1NR');
   </script>

   <style>
   body
   {
      white-space: nowrap;
   }
   </style>

   <title>Runbook</title>

   </head>

   <body>

      <p style="color:White; background-color:Black;" >Runbook v1.0 (MVP) - Pattern based AI powered runbook for multi cloud migration</p>

      <p style="background-color:Yellow;" >Runbook executed</p>

      <?php

      $domain=$_GET['domain'];
      $problem=$_GET['problem'];

      shell_exec("./execute.sh $domain $problem");

      $problem_executed_tasks=$problem . "_executed_tasks.txt";
      echo "<a href=log/$problem_executed_tasks download>$problem_executed_tasks</a><br>";

      $output = shell_exec("cat log/$problem_executed_tasks");
      echo "<p> <pre>$output</pre> </p>";

      ?>

   </body>

   <footer>
      <br>

   </footer>

</html>
