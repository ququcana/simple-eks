resource "aws_security_group_rule" "simple-vpc-sg-egress-rule" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.simple-vpc-control-panel-security-group.id
}