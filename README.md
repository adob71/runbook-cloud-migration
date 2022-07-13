### System Overview

### GUI

[https://runbook.adob71.com/](https://runbook.adob71.com/)

### API

[https://api.runbook.adob71.com/](https://api.runbook.adob71.com/)

### Project Structure
```
.
├── cli.alpine
├── cli.amazonlinux
├── Dockerfile.alpine
├── Dockerfile.amazonlinux
├── execute
│   ├── runbook_move_server_rack_to_rack_1_server.init
│   ├── runbook_move_server_rack_to_rack_2_server.init
│   ├── runbook_move_server_rack_to_rack_3_server.init
│   ├── runbook_move_server_rack_to_rack.php
│   ├── runbook_move_vm_to_container.php
│   ├── runbook_move_vm_to_instance.php
│   ├── runbook_move_vm_to_serverless_code.php
│   ├── runbook_move_vm_to_serverless_container.php
│   └── runbook_move_vm_to_vm.php
├── execute.php
├── execute.sh
├── httpd-foreground
├── index.html
├── log
├── plan
│   ├── ff
│   ├── runbook_move_server_rack_to_rack_1_server.pddl
│   ├── runbook_move_server_rack_to_rack_2_server.pddl
│   ├── runbook_move_server_rack_to_rack_3_server.pddl
│   ├── runbook_move_server_rack_to_rack.pddl
│   ├── runbook_move_vm_to_vm_app_db.pddl
│   ├── runbook_move_vm_to_vm.pddl
│   ├── runbook_move_vm_to_vm_singleton.pddl
│   └── runbook_move_vm_to_vm_web_app_db.pddl
├── plan.php
├── plan.sh
├── README.md
├── runbook-alpine-deployment.yaml
├── runbook-alpine-service.yaml
├── runbook-amazonlinux-deployment.yaml
└── runbook-amazonlinux-service.yaml
```
