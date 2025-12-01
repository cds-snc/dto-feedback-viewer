###
# Security groups for ECS
###

resource "aws_security_group" "ecs_tasks" {
  name        = "feedback-viewer-security-group"
  description = "Allow inbound and outbound traffic for Feedback Viewer"
  vpc_id      = var.vpc_id

  tags = {
    "CostCentre" = var.billing_code
  }
}

resource "aws_security_group_rule" "ecs_ingress_lb" {
  description              = "Allow the ecs security group to receive traffic only from the load balancer on port ${var.container_port}"
  type                     = "ingress"
  from_port                = var.container_port
  to_port                  = var.container_port
  protocol                 = "tcp"
  source_security_group_id = var.lb_security_group_id
  security_group_id        = aws_security_group.ecs_tasks.id
}

resource "aws_security_group_rule" "ecs_egress_https" {
  description       = "Allow ECS security group to send HTTPS traffic"
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ecs_tasks.id
}

resource "aws_security_group_rule" "ecs_egress_http" {
  description       = "Allow ECS security group to send HTTP traffic"
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ecs_tasks.id
}

resource "aws_security_group_rule" "ecs_egress_docdb" {
  description       = "Allow ECS security group to send traffic to DocumentDB"
  type              = "egress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ecs_tasks.id
}

###
# Traffic to DocumentDB should only come from ECS
###