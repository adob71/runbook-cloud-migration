(define

   (problem runbook_move_vm_to_vm_singleton)

   (:domain runbook_move_vm_to_vm)

   (:objects 

      movegroup-pattern - tMoveGroup

;;CMO
      singleton-CMO - tServerCMO datacenter-CMO - tCloudCMO

;;FMO
      singleton-FMO - tServerFMO publiccloud-FMO - tCloudFMO

   )

   (:init 
;;CMO
      (serverCompleted movegroup-pattern singleton-CMO datacenter-CMO) 

   )

   (:goal 
;;FMO
      (and 

      (moveGroupStarted movegroup-pattern)
      (serverCutover movegroup-pattern singleton-CMO datacenter-CMO singleton-FMO publiccloud-FMO) 
      (serverDecommissioned movegroup-pattern singleton-CMO datacenter-CMO)

      )

   )

)
