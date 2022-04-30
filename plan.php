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

      <p style="color:White; background-color:Black;" >Runbook v0.1 (MVP) - Pattern based AI powered runbook for multi cloud migration</p>

      <p style="background-color:Yellow;" >Runbook planned</p>

      <?php

      $domain=$_GET['domain'];
      $problem=$_GET['problem'];

      shell_exec("./plan.sh $domain $problem");

      $problem_planned_tasks=$problem . "_planned_tasks.txt";
      echo "<a href=log/$problem_planned_tasks download>$problem_planned_tasks</a><br>";

      $output = shell_exec("cat log/$problem_planned_tasks");
      echo "<p> <pre>$output</pre> </p>";

      ?>

      <form action="execute.php" method="get">
      <input type="hidden" name="domain" value="<?php echo $_GET['domain']; ?>">
      <input type="hidden" name="problem" value="<?php echo $_GET['problem']; ?>">
      <input type="submit" value="Execute">
      </form>

   </body>

   <footer>
      <br>

   </footer>

</html>
