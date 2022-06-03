resource "aws_instance" "sonarqube" {
    ami = var.my-ami-list["RHEL"]
    instance_type = var.my-instance-type[1]
    user_data = file("${path.module}/install-sonar.sh")
    key_name = var.my-key-pem

    vpc_security_group_ids = [aws_security_group.allow-sonar-ssh.id, aws_security_group.allow-sonar-web.id]

    tags = {
      "Name" = "SonarQube"
      "Source" = "Terraform"
    }
}