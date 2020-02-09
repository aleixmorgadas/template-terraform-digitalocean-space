resource "digitalocean_droplet" "webapp" {
  image      = "docker-18-04"
  name       = "webapp"
  region     = var.region
  size       = "s-1vcpu-1gb"
  monitoring = "true"
  ssh_keys = [
    var.ssh_fingerprint,
  ]

  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "docker run --rm -d -p 80:80 nginx",
    ]
  }
}

output "instance_ip_addr" {
  value = digitalocean_droplet.webapp.ipv4_address
}
