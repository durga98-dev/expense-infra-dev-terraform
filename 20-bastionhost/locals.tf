locals {
    ami_id = data.aws_ami.ec2_instance.id #Expressions which we want to reuse
    instance_type = "t3.micro" # we cannot override this value
}

locals {
    public_subnet_id = split (",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
}