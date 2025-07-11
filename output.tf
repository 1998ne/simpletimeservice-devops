output "ecs_service_name" {
  value = aws_ecs_service.app_service.name
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.app_cluster.name
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "alb_dns_name" {
  value = aws_lb.app_lb.dns_name
}
