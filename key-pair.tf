# Creating a key-pair for our first EC2 instance -->

resource "aws_key_pair" "key-pair" {
  key_name   = "first-key"
  public_key = file("${path.module}/id_rsa.pub")
}