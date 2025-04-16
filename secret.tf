resource "tls_private_key" "wikimedia_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "private_key_pem" {
  filename        = "key/wikimedia_key.pem"
  content         = tls_private_key.wikimedia_key.private_key_pem
  file_permission = "0400"
}

resource "aws_key_pair" "wikimedia_key_pair" {
  key_name   = "wikimedia-key"
  public_key = tls_private_key.wikimedia_key.public_key_openssh
}

########################################################

resource "tls_private_key" "wikimediadb_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "db_private_key_pem" {
  filename        = "key/wikimediadb_key.pem"
  content         = tls_private_key.wikimediadb_key.private_key_pem
  file_permission = "0400"
}

resource "aws_key_pair" "wikimediadb_key_pair" {
  key_name   = "wikimediadb-key"
  public_key = tls_private_key.wikimediadb_key.public_key_openssh
}