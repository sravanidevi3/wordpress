variable "aws_region"{
        type = string
        default = "ap-south-1"
}
variable "dockerfile_dir" {
  type = string
  description = "The directory that contains the Dockerfile"
  default     = "/var/lib/jenkins/workspace/Clever-Tap-Wordpress.Docker/"
}

variable "ecr_repository_url" {
  type        = string
  description = "Full url for the ECR repository"
  default = "900024488048.dkr.ecr.ap-south-1.amazonaws.com/clevertap"
}

variable "health_check" {
  type = map
  default = {
    interval = 60
    port                = "80"
    healthy_threshold   = 10
    path                = "/wp-admin/setup-config.php"
    unhealthy_threshold = 10
    timeout             = 10
    protocol            = "HTTP"
    matcher             = 200
  }
}

variable "vpc_id" {
  type = string
  default = "vpc-fa10e491"
}

variable "tag" {
 type = string
 default = "latest"
}

variable "load_balancer" {
  type = map
  default = {
    name = "clevertap-wordpress"
    port = "80"
  }
}


