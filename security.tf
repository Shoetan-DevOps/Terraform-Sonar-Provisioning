resource "aws_security_group" "allow-sonar-ssh" {
    name        = "allow_sonar_ssh"
    description = "Allow SSH inbound traffic"
    #vpc_id = aws_vpc.main.id  
  
    ingress {
        description      = "TLS from VPC"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
       #ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
      "Name" = "allow-sonar-ssh"
    }
}


resource "aws_security_group" "allow-sonar-web" {
    name        = "allow_sonar_web"
    description = "Allow Web inbound traffic on 9000"
    #vpc_id = aws_vpc.main.id  
  
    ingress {
        description      = "TLS from VPC"
        from_port        = 9000
        to_port          = 9000
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
       #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
      "Name" = "allow-sonar-Web"
    }
}
