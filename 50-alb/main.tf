module "alb" {
  source = "terraform-aws-modules/alb/aws"
  internal = true


#expense-dev-alb
  name    = "${var.project_name}-${var.environment}-app-alb"
  vpc_id  = data.aws_ssm_parameter.vpc_id.id
  subnets = local.private_subnet_ids
  create_security_group = false
  security_groups = [local.app_alb_sg_id]


  tags = merge(var.common_tags,
  {
    Name = "${var.project_name}-${var.environment}-app-alb"
  }
  )
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = module.alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "fixed-response"
    
    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hello, I'm from backend app ALB</h1>"
      status_code  = "200"
  }
}
}