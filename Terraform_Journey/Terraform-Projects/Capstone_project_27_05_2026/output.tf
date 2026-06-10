output "public_ip" {
  value       = aws_instance.web.public_ip
  description = "Visit http://<public_ip> in your browser"
}