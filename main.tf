variable ssh_keys {
  type = map(string)
}

module ssh_key {
  source         = "app.terraform.io/0/ssh_key/digitalocean"
  version        = "0.0.1"

  foreach        = var.ssh_keys

  ssh_key_name   = each.key
  ssh_public_key = each.value
}

output ssh_key_name {
  value = module.ssh_key.ssh_key_name
}
