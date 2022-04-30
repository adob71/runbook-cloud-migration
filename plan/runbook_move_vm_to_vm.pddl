;;(c) runbook.expert

(define

   (domain runbook_move_vm_to_vm)

   (:types
         tMoveGroup - object
         tServer - object
         tServerCMO tServerFMO - tServer
         tCloud - object
         tCloudCMO tCloudFMO - tCloud
   )

   (:predicates 
         (moveGroupStarted ?mg - tMoveGroup)
         (serverAddedToMoveGroup ?mg - tMoveGroup ?s_cmo - tServerCMO ?c_cmo - tCloudCMO ?s_fmo - tServerFMO ?c_fmo - tCloudFMO)
         (serverBuilt ?mg - tMoveGroup ?s - tServerFMO ?c - tCloudFMO) 
         (storageVolumeBuilt ?mg - tMoveGroup ?s - tServerFMO ?c - tCloudFMO) 
         (codeDeployed ?mg - tMoveGroup ?s - tServerFMO ?c - tCloudFMO)
         (serviceStarted ?mg - tMoveGroup ?s - tServerFMO ?c - tCloudFMO)
         (dataCopied ?mg - tMoveGroup ?s_cmo - tServerCMO ?c_cmo - tCloudCMO ?s_fmo - tServerFMO ?c_fmo - tCloudFMO)
         (serverParallelRun ?mg - tMoveGroup ?s_cmo - tServerCMO ?c_cmo - tCloudCMO ?s_fmo - tServerFMO ?c_fmo - tCloudFMO)
         (serverCutover ?mg - tMoveGroup ?s_cmo - tServerCMO ?c_cmo - tCloudCMO ?s_fmo - tServerFMO ?c_fmo - tCloudFMO)
         (serverToBeDecommissioned ?mg - tMoveGroup ?s_cmo - tServerCMO ?c_cmo - tCloudCMO)
         (serverCompleted ?mg - tMoveGroup ?s - tServer ?c - tCloud)
         (serverBackedUp ?mg - tMoveGroup ?s - tServerCMO ?c - tCloudCMO)
         (serverDecommissioned ?mg - tMoveGroup ?s_cmo - tServerCMO ?c_cmo - tCloudCMO)
   )

   (:action Start-MoveGroup
      :parameters
         (?mg - tMoveGroup)
      :precondition
         (not(moveGroupStarted ?mg))
      :effect
         (moveGroupStarted ?mg)
   )

   (:action Add-Server-To-MoveGroup
      :parameters
         (?mg - tMoveGroup ?s_cmo - tServerCMO ?c_cmo - tCloudCMO ?s_fmo - tServerFMO ?c_fmo - tCloudFMO)
      :precondition
         (and
         (moveGroupStarted ?mg)
         (not(serverAddedToMoveGroup ?mg ?s_cmo ?c_cmo ?s_fmo ?c_fmo))
         )
      :effect
         (serverAddedToMoveGroup ?mg ?s_cmo ?c_cmo ?s_fmo ?c_fmo)
   )

   (:action Build-Server
      :parameters 
         (?mg - tMoveGroup ?s - tServerFMO ?c - tCloudFMO) 
      :precondition 
         (and
         (moveGroupStarted ?mg) 
         (not(serverBuilt ?mg ?s ?c))
         )
      :effect 
         (serverBuilt ?mg ?s ?c)
   )

   (:action Build-Storage-Volume
      :parameters
         (?mg - tMoveGroup ?s - tServerFMO ?c - tCloudFMO)
      :precondition
         (and
         (moveGroupStarted ?mg)
         (serverBuilt ?mg ?s ?c)
         (not(storageVolumeBuilt ?mg ?s ?c))
         )
      :effect
         (storageVolumeBuilt ?mg ?s ?c)
   )

   (:action Deploy-Code
      :parameters
         (?mg - tMoveGroup ?s - tServerFMO ?c - tCloudFMO)
      :precondition 
         (and
         (moveGroupStarted ?mg)
	 (serverBuilt ?mg ?s ?c)
         (storageVolumeBuilt ?mg ?s ?c)
         (not(codeDeployed ?mg ?s ?c))
         )
      :effect 
         (codeDeployed ?mg ?s ?c)
   )

   (:action Start-Service
      :parameters 
         (?mg - tMoveGroup ?s - tServerFMO ?c - tCloudFMO)
      :precondition 
         (and 
         (moveGroupStarted ?mg)
         (serverBuilt ?mg ?s ?c)
         (storageVolumeBuilt ?mg ?s ?c)
         (codeDeployed ?mg ?s ?c)
         (not(serviceStarted ?mg ?s ?c))
         ) 
      :effect 
         (serviceStarted ?mg ?s ?c)
   )

   (:action Copy-Data
      :parameters 
         (?mg - tMoveGroup ?s_cmo - tServerCMO ?c_cmo - tCloudCMO ?s_fmo - tServerFMO ?c_fmo - tCloudFMO)
      :precondition 
         (and 
         (moveGroupStarted ?mg)
         (serverAddedToMoveGroup ?mg ?s_cmo ?c_cmo ?s_fmo ?c_fmo)
         (serverCompleted ?mg ?s_cmo ?c_cmo)
         (serverBuilt ?mg ?s_fmo ?c_fmo) 
         (storageVolumeBuilt ?mg ?s_fmo ?c_fmo) 
         (codeDeployed ?mg ?s_fmo ?c_fmo) 
         (serviceStarted ?mg ?s_fmo ?c_fmo) 
         (not(dataCopied ?mg ?s_cmo ?c_cmo ?s_fmo ?c_fmo))
         )
      :effect 
         (dataCopied ?mg ?s_cmo ?c_cmo ?s_fmo ?c_fmo)
   )

   (:action Parallel-Run-Server
      :parameters
         (?mg - tMoveGroup ?s_cmo - tServerCMO ?c_cmo - tCloudCMO ?s_fmo - tServerFMO ?c_fmo - tCloudFMO)
      :precondition
         (and
         (moveGroupStarted ?mg)
         (serverAddedToMoveGroup ?mg ?s_cmo ?c_cmo ?s_fmo ?c_fmo)
         (serverCompleted ?mg ?s_cmo ?c_cmo)
         (serverBuilt ?mg ?s_fmo ?c_fmo)
         (storageVolumeBuilt ?mg ?s_fmo ?c_fmo)
         (codeDeployed ?mg ?s_fmo ?c_fmo)
         (serviceStarted ?mg ?s_fmo ?c_fmo)
         (dataCopied ?mg ?s_cmo ?c_cmo ?s_fmo ?c_fmo)
         (not(serverParallelRun ?mg ?s_cmo ?c_cmo ?s_fmo ?c_fmo))
         )
      :effect
         (serverParallelRun ?mg ?s_cmo ?c_cmo ?s_fmo ?c_fmo)
   )

   (:action Cutover-Server
      :parameters 
         (?mg - tMoveGroup ?s_cmo - tServerCMO ?c_cmo - tCloudCMO ?s_fmo - tServerFMO ?c_fmo - tCloudFMO)
      :precondition 
         (and 
         (moveGroupStarted ?mg)
         (serverAddedToMoveGroup ?mg ?s_cmo ?c_cmo ?s_fmo ?c_fmo)
         (serverCompleted ?mg ?s_cmo ?c_cmo)
         (serverBuilt ?mg ?s_fmo ?c_fmo)
         (storageVolumeBuilt ?mg ?s_fmo ?c_fmo)
         (codeDeployed ?mg ?s_fmo ?c_fmo)
         (serviceStarted ?mg ?s_fmo ?c_fmo)
         (dataCopied ?mg ?s_cmo ?c_cmo ?s_fmo ?c_fmo)
         (serverParallelRun ?mg ?s_cmo ?c_cmo ?s_fmo ?c_fmo)
         (not(serverCutover ?mg ?s_cmo ?c_cmo ?s_fmo ?c_fmo))
         )
      :effect 
         (and
         (serverCutover ?mg ?s_cmo ?c_cmo ?s_fmo ?c_fmo)
         (serverToBeDecommissioned ?mg ?s_cmo ?c_cmo)
         (serverCompleted ?mg ?s_fmo ?c_fmo)
         )
   )

   (:action Back-Up-Server
      :parameters
         (?mg - tMoveGroup ?s - tServerCMO ?c - tCloudCMO)
      :precondition
         (and
         (moveGroupStarted ?mg)
         (serverCompleted ?mg ?s ?c)
         (serverToBeDecommissioned ?mg ?s ?c)
         (not(serverBackedUp ?mg ?s ?c))
         )
      :effect
         (serverBackedUp ?mg ?s ?c)
   )

   (:action Decommission-Server
      :parameters 
         (?mg - tMoveGroup ?s_cmo - tServerCMO ?c_cmo - tCloudCMO)
      :precondition 
         (and
         (moveGroupStarted ?mg)
         (serverCompleted ?mg ?s_cmo ?c_cmo)
         (serverToBeDecommissioned ?mg ?s_cmo ?c_cmo)
         (serverBackedUp ?mg ?s_cmo ?c_cmo)
         (not(serverDecommissioned ?mg ?s_cmo ?c_cmo))
         )
      :effect 
         (and
         (serverDecommissioned ?mg ?s_cmo ?c_cmo)
         (not(serverCompleted ?mg ?s_cmo ?c_cmo))
         )
   )

)
