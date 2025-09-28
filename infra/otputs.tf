output "ec2_public_ip" {
  value = aws_instance.jenkinsapp-server
}


output "ec2_public_ip2" {
  value = aws_instance.kubernetes-server
}