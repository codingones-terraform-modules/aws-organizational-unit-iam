resource "aws_iam_user" "iam_deployer" {
  name = "${var.aws_organization}.iam.infrastructure"
}

resource "aws_iam_group" "iam_deployer_group" {
  name = "iam.deployer"
}

resource "aws_iam_user_group_membership" "iam_deployer_membership" {
  user = aws_iam_user.iam_deployer.name

  groups = [
    aws_iam_group.iam_deployer_group.name,
  ]
}

resource "aws_iam_access_key" "deployer_access_key" {
  user = aws_iam_user.iam_deployer.name
}

resource "aws_iam_group_policy_attachment" "create_iam_user_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
  group      = aws_iam_group.iam_deployer_group.name
}
