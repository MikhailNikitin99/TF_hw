output "vms_info" {
  value = concat(
    [for w in yandex_compute_instance.web : {
      name = w.name
      id = w.id
      fqdn = w.fqdn
    }],
    [for d in yandex_compute_instance.db : {
      name = d.name
      id = d.id
      fqdn = d.fqdn
    }],
    [for s in tolist([yandex_compute_instance.storage]) : {
      name = s.name
      id = s.id
      fqdn = s.fqdn
    }]
  )
}
