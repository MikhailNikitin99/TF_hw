locals {
    vm_web_name = "${var.company_name}-${var.vpc_name}-platform-${var.web_server_name}"
    vm_db_name = "${var.company_name}-${var.vpc_name}-platform-${var.db_server_name}"
    #test = [
    #    {
    #        "dev1" = [
    #            "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
    #            "10.0.1.7",
    #        ]
    #   },
    #   {
    #        "dev2" = [
    #            "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
    #            "10.0.2.29",
    #        ]
    #    },
    #    {
    #        "prod1" = [
    #            "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
    #            "10.0.1.30",
    #            ]
    #        },
    #    ]
    }