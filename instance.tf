resource "aws_instance" "wikimedia" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.small"
  key_name               = aws_key_pair.wikimedia_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.wikimedia_sg.id]

  root_block_device {
    volume_size = 20
  }

  tags = {
    Name = "wikimedia"
  }
}

resource "aws_instance" "wikimediadb" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.small"
  key_name               = aws_key_pair.wikimediadb_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.wikimediadb_sg.id]

  #root_block_device {
  #  volume_size = 20
  #}

  tags = {
    Name = "wikimediadb"
  }
}

