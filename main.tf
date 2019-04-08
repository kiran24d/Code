module "this" {
  source = "github.com/traveloka/terraform-aws-iam-role.git//modules/user?ref=v0.3.0"

  role_name                  = "ReadOnly"
  role_description           = "Read Only Role for IAM User"
  role_force_detach_policies = true

  trusted_users             = ["${var.trusted_users}"]
  mfa_required              = "${var.mfa_required}"
  role_max_session_duration = "${var.role_max_session_duration}"
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = "${module.this.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}