resource "aws_instance" "testbox" {
    ami = "ami-0776c814353b4814d" #ubuntu 20.04
    instance_type = "t2.small"
    
    security_groups = [
        "test-sg"
    ]

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