;;(c) runbook.expert

(define

   (problem runbook_move_vm_to_vm_app_db)

   (:domain runbook_move_vm_to_vm)

   (:objects 

      movegroup-pattern - tMoveGroup

;;CMO
      db-CMO - tServerCMO datacenter-CMO - tCloudCMO
      app-CMO - tServerCMO datacenter-CMO - tCloudCMO
;;FMO
      db-FMO - tServerFMO publiccloud-FMO - tCloudFMO
      app-FMO - tServerFMO publiccloud-FMO - tCloudFMO

   )

   (:init 
;;CMO

      (serverCompleted movegroup-pattern db-CMO datacenter-CMO) 

      (serverCompleted movegroup-pattern app-CMO datacenter-CMO)

   )

   (:goal 
;;FMO
      (and 

      (moveGroupStarted movegroup-pattern)

      (serverCutover movegroup-pattern db-CMO datacenter-CMO db-FMO publiccloud-FMO) 
      (serverDecommissioned movegroup-pattern db-CMO datacenter-CMO)

      (serverCutover movegroup-pattern app-CMO datacenter-CMO app-FMO publiccloud-FMO)
      (serverDecommissioned movegroup-pattern app-CMO datacenter-CMO)

      )

   )

)
