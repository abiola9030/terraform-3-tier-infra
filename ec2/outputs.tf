output "instance_ids" {
    value = aws_instance.business_logic[*].id
}