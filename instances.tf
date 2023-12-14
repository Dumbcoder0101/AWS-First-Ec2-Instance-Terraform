# Creating EC2 Instance -->

resource "aws_instance" "demo-ec2-tf" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key-pair.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]

  # Using user_data is not a good practice in terraform...
  ### user_data = file("${path.module}/nginx-script.sh")

  tags = {
    Name = "First-tf-instance"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }

  # uses of provisioner --> type - file
  provisioner "file" {
    source      = "README.md"
    destination = "/tmp/README.md"
  }

  # uses of provisioner --> type - file
  provisioner "file" {
    content     = "Hello, Content"
    destination = "/tmp/content.txt"
  }

  # uses of provisioner --> type - local-exec
  provisioner "local-exec" {
    when       = create
    on_failure = continue
    command    = "echo 'Hello Murtaza, Your intance is ready to work...'>/tmp/localcommand.txt"
  }

  # uses of provisioner --> type - local-exec
  provisioner "local-exec" {
    when    = destroy
    command = "echo '\n Hello Murtaza, Your intance destroyed successfully...'>/tmp/localcommand.txt"
  }

  # uses of provisioner --> type - remote-exec
  provisioner "remote-exec" {
    script = "./tempscript.sh"
  }

  # uses of provisioner --> type - remote-exec
  provisioner "remote-exec" {
    inline = [
      "ifconfig>/tmp/ifconfig.output",
      "echo 'Hello Murtaza'>/tmp/Hello.txt"
    ]
  }
}