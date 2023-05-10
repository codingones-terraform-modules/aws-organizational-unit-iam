output "aws_deployer_iam_access_key_id" {
  value     = aws_iam_access_key.deployer_access_key.id
  sensitive = true
}

output "aws_deployer_iam_access_key_secret" {
  value     = aws_iam_access_key.deployer_access_key.secret
  sensitive = true
}