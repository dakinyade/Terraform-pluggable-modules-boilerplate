########### ECS CLUSTER ##########
variable "ecs_clusters" {
  type = list(any)
  description = "ecsclusters Values"
}
############ END ################


########### ECS TASKS ##########
variable "ecs_tasks" {
  type = list(any)
  description = "ecs Tasks Values"
}
############ END ################

########### ECS SERVICES ##########
variable "ecs_services" {
  type = list(any)
  description = "ecs services Values"
}
############ END ################