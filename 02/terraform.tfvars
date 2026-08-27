vms_resources = {
  web = {
    cores         = 2
    memory        = 1
    core_fraction = 5
    size          = 10
    type          = "network-hdd"
  },
  db = {
    cores         = 2
    memory        = 1
    core_fraction = 20
    size          = 10
    type          = "network-hdd"
  }
}

vms_metadata = {
  serial-port-enable = 1
  ssh-keys           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFWNTWN5zhNbXBHenFOnTWjkdMaoDYqjmAz8d4R/WxephdJKPd0/ztEaHQWtYRSYhepET/tBPj/quKHmTMHOHi9mJhpT54XA7sPL8sYNVe7sXU0CgP2UNBQBxiQnIBab0dMPaddxtFPfeY7+8KIEfMuY0C04MDULNL27wyuFN6hzH/2yrYcZEYLrZC1NlGbwswZiqUjZJc3WGOPefq4B+iHf754Y8IHE0G2LDAoz9pff7VrgtoE+NJHU1n8mfNAfyViwegpdkQGFy2jQPvm9BvBhZLN13us/b5TaYXfW9GrAK1wIQtacIB0c6QEd5sBHFsh139bFdpImIDACzLzLdh"
}