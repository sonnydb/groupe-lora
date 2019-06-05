 provider "scaleway" {
   organization = "2b6ff09b-1662-4dc2-9ff0-ae5ebcac2b27"
   token        = "SCWYB38WSWYWVW9NJ9GF"
   region       = "par1"
 }
 
 resource "scaleway_ip" "ip" {
 }
 
 data "scaleway_image" "ubuntu-apache" {
   architecture = "x86_64"
   name         = "ubuntu-apache" 
 }
 
 resource "scaleway_server" "ubuntu-apache-server" {
   name  = "ubuntu-apache-server"
   public_ip = "${scaleway_ip.ip.ip}"
   image = "${data.scaleway_image.ubuntu-apache.id}"
   type  = "C2M"

 }


 resource "scaleway_security_group" "http" {
   name        = "http"
   description = "allow HTTP and HTTPS traffic"
 }
 
 resource "scaleway_security_group_rule" "http_accept" {
   security_group = "${scaleway_security_group.http.id}"
 
   action    = "accept"
   direction = "inbound"
   ip_range  = "0.0.0.0/0"
   protocol  = "TCP"
   port      = 80
 }
 
 resource "scaleway_security_group_rule" "https_accept" {
   security_group = "${scaleway_security_group.http.id}"
 
   action    = "accept"
   direction = "inbound"
   ip_range  = "0.0.0.0/0"
   protocol  = "TCP"
   port      = 443
 }

