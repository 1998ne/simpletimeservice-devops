variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "ecs_cluster_name" {
  default = "simpletime-cluster"
}

variable "app_name" {
  default = "simpletime-app"
}

variable "container_port" {
  default = 5000
}

variable "docker_image" {
  description = "Docker image name with tag"
  default     = "yourdockerhubusername/simpletimeservice:latest"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
