variable "cluster_name" {
  description = "tf-cluster"
}

variable "app_repository_name" {
  description = "mldep-a"
}

variable "app_service_name" {
  description = "service"
}

variable "git_repository" {
  type        = string
  description = "ecs task environment variables"
}

variable "vpc_id" {
  description = "vpc-9d5888f6"
}

variable "repository_url" {
  description = "https://ap-south-1.console.aws.amazon.com/ecr/repositories/private/425715685170/mldep?region=ap-south-1"
}

variable "subnet_ids" {
  type        = list(string)
  description = "this is"
  default = [
    "subnet-24341a68",
    "subnet-52cabb29", 
    "subnet-e83fc683"]
}

variable "region" {
  description = "The region to use"
  default     = "ap-south-1"
}

variable "container_name" {
  description = "Container"
}

variable "build_args" {
  type    = map(string)
  default = {}
}

variable "build_options" {
  type        = string
  default     = ""
  description = "Docker build options. ex: '-f ./build/Dockerfile' "
}

variable "repository_branch" {
  description = "Repository branch to connect to"
  default     = "main"
}

variable "repository_owner" {
  description = "GitHub repository owner"
  default     = "shivani3495"
}

variable "repository_name" {
  description = "GitHub repository name"
  default     = "mltf"
}
