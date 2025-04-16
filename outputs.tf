output "instance_ip" {
  value = aws_instance.wikimedia.public_ip
}

output "ssh_private_key" {
  sensitive = true
  value     = tls_private_key.wikimedia_key.private_key_pem
}

#################################

output "db_instance_ip" {
  value = aws_instance.wikimediadb.public_ip
}

output "db_ssh_private_key" {
  sensitive = true
  value     = tls_private_key.wikimediadb_key.private_key_pem
}