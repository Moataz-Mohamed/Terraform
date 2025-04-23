resource "aws_instance" "web" {
  ami = var.amiID[var.region]
  # The ami attribute specifies the Amazon Machine Image (AMI) ID to use for the instance.
  # The AMI ID is a unique identifier for the image that contains the operating system and software to be installed on the instance.
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = [aws_security_group.dove-sg.id]
  availability_zone      = var.zone1
  # The availability_zone attribute specifies the availability zone in which to launch the instance.


  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }

  # Copies the myapp.conf file to /etc/myapp.conf
  provisioner "file" {
    source      = "web.sh"
    destination = "/home/ubuntu/web.sh"
  }

  # Establishes connection to be used by all
  # generic remote provisioners (i.e. file/remote-exec)
  connection {
    type = "ssh"
    user = var.webuser
    # The user attribute specifies the username to use for the SSH connection.
    private_key = file("dovekey")
    # The private_key attribute specifies the path to the private key file to use for authentication.
    host = self.public_ip
  }



  provisioner "remote-exec" {
    inline = [
      "sudo mv /home/ubuntu/web.sh /tmp/web.sh",
      "sudo chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }
  # The inline attribute specifies a list of commands to be executed on the remote instance.

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ip.txt"
    # The command attribute specifies the command to be executed on the local machine.
    # In this case, it writes the public IP address of the instance to a file named ip.txt.

  }


}

resource "aws_ec2_instance_state" "web-state" {
  # This resource is used to manage the state of an EC2 instance.
  instance_id = aws_instance.web.id
  state       = "running"
  # The above code is a Terraform configuration file that defines a resource block for managing the state of an AWS EC2 instance.
  # The instance_id attribute specifies the ID of the EC2 instance to be managed.
  # The state attribute specifies the desired state of the instance, which in this case is "running".
  # The resource block is used to ensure that the specified EC2 instance is in the desired state.
  # The resource block is a fundamental part of any Terraform configuration, as it establishes the connection to the cloud provider's API.
}

output "WebPublicIP" {
  description = "Public IP of the web instance"
  value       = aws_instance.web.public_ip

}

output "WebPrivateIP" {
  description = "Private IP of the web instance"
  value       = aws_instance.web.private_ip

}