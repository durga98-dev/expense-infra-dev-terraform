#creating Ec2 instance
resource "aws_instance" "bastion-server"{
    ami = local.ami_id #data.aws_ami.ec2_instance.id
    vpc_security_group_ids = [ data.aws_ssm_parameter.bastion_sg_id.value ]
    instance_type = local.instance_type
    subnet_id = local.public_subnet_id
    tags = merge( var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-bastion"
    }
    )
    
}