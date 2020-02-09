variable "do_token" {
}

variable "pub_key" {
}

variable "pvt_key" {
}

variable "ssh_fingerprint" {
}

variable "region" {
  type    = string
  default = "fra1"
}

provider "digitalocean" {
  token             = var.do_token
}

