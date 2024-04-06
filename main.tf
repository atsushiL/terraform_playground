provider "aws" {
    region = "ap-northeast-1"
}


resource "aws_instance" "hello-world" {
    ami = "ami-0253ce315ad0c9655"
    instance_type = "t2.micro"

    tags = {
        Name = "Helloworld"
    }

    user_data = <<EOF
#!/bin/bash
amazon-linux-extras install -y nginx1.12
systemctl start nginx
EOF

}
