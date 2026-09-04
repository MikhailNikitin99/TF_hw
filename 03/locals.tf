locals {
  ssh_key = file("~/.ssh/yc-key.pub")
  private_key = "~/.ssh/yc-key"
}
