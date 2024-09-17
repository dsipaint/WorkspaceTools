variable "password" {
  type = string
  description = "ec2 login password for alspal"
}

resource "aws_instance" "testbox" {
    ami = "ami-0776c814353b4814d" #ubuntu 20.04
    instance_type = "t2.small"
    
    security_groups = [
        "test-sg"
    ]

    user_data = <<EOF
#!/bin/bash
sed 's/#PasswordAuthentication.*/PasswordAuthentication yes/' -i /etc/ssh/sshd_config
sed 's/#   PasswordAuthentication yes/    PasswordAuthentication yes/' -i /etc/ssh/ssh_config
echo 'ssh pwauth: true' >> /etc/cloud/cloud.cfg
echo 'PasswordAuthentication yes' > /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
service ssh restart

echo 'ubuntu:${var.password}' | sudo chpasswd
EOF

    # SSH key to use
    key_name = "bot-server-ssh-keypair"

    tags = {
        "Name": "testbox",
        "project": "test"
    }

    #8GB of memory
    root_block_device {
      tags = {}
      volume_size = 8
    }
}