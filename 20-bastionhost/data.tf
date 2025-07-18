data "aws_ami" "ec2_instance"{
    most_recent = true #mandatory as we require latest
    owners = ["973714476881"]

        filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
        }

        filter {
            name   = "virtualization-type"
            values = ["hvm"]
        }

        filter {
            name = "root-device-type"
            values = ["ebs"]
        }
}

data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project_name}/${var.environment}/bastion-sg-id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/public-subnet-ids"
}