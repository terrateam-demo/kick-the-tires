resource "null_resource" "this" {
  count = var.instance_count

  provisioner "local-exec" {
    command = "echo 'Simulated instance creation: Name=${var.instance_name}, Zone=${var.instance_zone}, Image=${var.boot_disk_image}, Network=${var.network_name}'"
  }
}

variable "instance_count" {
  type    = number
  default = 0
}

variable "instance_name" {
  type    = string
  default = ""
}

variable "instance_zone" {
  type    = string
  default = "us-central1-a"
}

variable "boot_disk_image" {
  type    = string
  default = "debian-cloud/debian-11"
}

variable "network_name" {
  type    = string
  default = "default"
}
# Trigger
