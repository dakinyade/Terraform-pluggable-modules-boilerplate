terraform {
   required_version = ">= 0.12"
  //enforcing this aws version in the module
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=4.28.0"
    }
  }
}

######################## ECS CLUSTERS ########################
resource "aws_ecs_cluster" "AllClusters" {
  count = length(var.ecs_clusters) > 0 ? length(var.ecs_clusters) : 0 
  name  = var.ecs_clusters[count.index].name
  tags  = var.ecs_clusters[count.index].tags
}
####################### END #################################

######################## ECS TASKS DEFINITION ########################
resource "aws_ecs_task_definition" "tasks" {
  count = length(var.ecs_tasks) > 0 ? length(var.ecs_tasks) : 0 
  family                   = var.ecs_tasks[count.index].family
  network_mode             = var.ecs_tasks[count.index].network_mode
  requires_compatibilities = var.ecs_tasks[count.index].requires_compatibilities
  cpu                      = var.ecs_tasks[count.index].cpu
  memory                   = var.ecs_tasks[count.index].memory
  container_definitions    = var.ecs_tasks[count.index].container_definitions
}
######################## END ########################


######################## ECS SERVICES ########################
resource "aws_ecs_service" "ecs_services" {
  count = length(var.ecs_services) > 0 ? length(var.ecs_services) : 0 
  name            = var.ecs_services[count.index].name
  cluster         = aws_ecs_cluster.AllClusters[var.ecs_services[count.index].cluster_index].id
  task_definition = aws_ecs_task_definition.tasks[var.ecs_services[count.index].cluster_index].arn
  desired_count   = var.ecs_services[count.index].desired_count
  launch_type     = var.ecs_services[count.index].launch_type

  network_configuration {
    security_groups = var.ecs_services[count.index].network_security_groups
    subnets         = var.ecs_services[count.index].network_subnet
  }

  # load_balancer {
  #   target_group_arn = aws_lb_target_group.hello_world.id
  #   container_name   = "hello-world-app"
  #   container_port   = 3000
  # }
}
######################## END ########################
