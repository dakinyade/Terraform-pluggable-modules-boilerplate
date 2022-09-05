################## VPC SECTION ##################
vpcs = [
  {
      cidr_block        = "10.10.0.0/20",
      instance_tenancy  =  "default" ,
     tags = {
        Name = "main_10.10.0.0/20" 
      }
  }
]

cidr_block = ["10.10.0.0/20"]
availability_zone = ["us-west-1a", "us-west-1b"]
subnets_block=[
    {
        name= "availability_zone_1_private",
        network_scope = "private",
        cidr_range = "10.10.1.0/24",
        az = "us-west-1a",
        public = false

    },
    {
        name= "availability_zone_2_private",
        network_scope = "private",
        cidr_range = "10.10.2.0/24",
        az = "us-west-1b",
        public = false
    },
     {
        name= "availability_zone_1_public",
        network_scope = "public",
        cidr_range = "10.10.3.0/24",
        az = "us-west-1a",
        public = true
    },
     {
        name= "availability_zone_2_public",
        network_scope = "public",
        cidr_range = "10.10.4.0/24",
        az = "us-west-1b",
        public = true
    }
]
################## INTERNET GATEWAY ################## 
gateways = [
 {
  vpc_index = 0,
  tags      = {
    Name = "main_10.0.0.20_internet_gtw"
  } 
 }

]

################## ROUTE TABLES ################## 
route_tables = [
  {
    vpc_index = 0,
    tags = {
      Name = "main_10.0.0.20_route_table"
    }
  }
]


################## ROUTE TABLES ROUTES ################## 
route_tables_routes = [
  {
    destination_cidr_block = "0.0.0.0/0",
    gatewayIndex = 0, //OPTIONAL - used to select the internet gateway to use, 0 for the first decleared IGW
    route_table_index = 0,
    //egress_only_gateway_index = 0
    tags = {
      Name = "public_10.0.0.20_route_table_IGW_route"
    }
  }
]

################## NETWORK INTERFACES SECTION ################## 
network_Interfaces=[
    {
     subnet_id = "subnet-03e47c72af5352c18",
     private_ips = [],
     tags = {
        name = "test-server-eni-private-subnet",
        subnet = "private-subnet"
     } 
    }
]


################## EC2 SECTION ################## 
ec2_values =[
    {
      ami = "ami-085284d24fe829cd0"
      instance_type = "t2.micro"
      subnet_id = "subnet-094e656eeb093eee5",
      subnet_index = 3
      vpc_security_group_ids = ["sg-09ab5aae64e88647d", "sg-05bdb03ee54abd083"]
      private_ip = "",
      key_name = "DNA-Deployer"
      tags = {
        Name = "Test Server"
      }
    },
    {
      ami = "ami-085284d24fe829cd0"
      instance_type = "t2.micro"
      subnet_id = "subnet-0f06d354b07122c1a",
      subnet_index = 3
      vpc_security_group_ids = ["sg-09ab5aae64e88647d", "sg-05bdb03ee54abd083"]
      private_ip = "",
      key_name = "DNA-Deployer"
      tags = {
        Name = "Private test Server"
      }
    }
]

################## SECURITY SECTION ################## 
sg_information =[
    {
      name = "EC2-SSG-Open-All",
      description = "Grant EC2s all port permissions, testing ",
      vpc_id = "vpc-011730b9b6104c214",
      ingress = {
      description = "Ingress connection defination" ,
      from_port   =  "0",
      protocol    =  "-1",
      to_port     =  "0",
      cidr_blocks =  ["0.0.0.0/0"],
      ipv6_cidr_blocks = ["::/0"]
      },
      egress = {
      description = "Egress connection defination" ,
      from_port   =  "0",
      protocol    =  "-1",
      to_port     =  "0",
      cidr_blocks =  ["0.0.0.0/0"],
      ipv6_cidr_blocks = ["::/0"]
      },
      tags = {
        name = "Security-group-EC2-SSG-Open-All"
      }
    },
    {
      name = "ICMP-EC2-SSG",
      description = "Grant ICMP to server permissions, testing ",
      vpc_id = "vpc-011730b9b6104c214",
      ingress = {
      description = "Ingress connection defination" ,
      from_port   =  "0",
      protocol    =  "icmp",
      to_port     =  "0",
      cidr_blocks =  ["0.0.0.0/0"],
      ipv6_cidr_blocks = ["::/0"]
      },
      egress = {
      description = "Egress connection defination" ,
      from_port   =  "0",
      protocol    =  "icmp",
      to_port     =  "0",
      cidr_blocks =  ["0.0.0.0/0"],
      ipv6_cidr_blocks = ["::/0"]
      },
      tags = {
        name = "icmp-Security-group-EC2-SSG-Open-All"
      }
    }
]

################## SECURITY KEYPAIRS ################## 
key_pairs = [
  {
    key_name   = "DNA-Deployer",
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGohJ8iR8ZtBJiUO1lqQRKmxuazhnih9xpZv5/CyRYQIwDvajwucvT7ve5jeHgsCIcN7wSN/BhwyqvJaRv+0cZdoL3FJFmYCq/WsTtrTVWW2rrf1doNNqasQ+iw36DVmioc/D2ravewsrZ15llVTL0szuTF+uvI0H8kmgHJZecmQFg8hkCPZBGRg1VKtB3DBaAgqMGVJ1OlUH1PMz1ouQQeX5Gpu0Vh+9S5xmJnY4/u5C3UyxYeP512XZ5EfNT6ofDRz8v4NAqwvsnQnMl8AtA6UJK38z2jsl/CiAOCWyT7DIdeoPx9sUYyFWZgSprzeSZ1mUbPHDsrLQcvc41j1gH mac@DNA-MAC.local"
    tags       = {
      name = "DNA-Deployer"
    }
  },
  {
    key_name   = "test-deployer-key",
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDUVavKqk0U1ADOSynVsGUAutSeQIkyrFqZIGNnQgYjey/Ii2jfNMie2EH5wOqU3tAWB8Xq9noHOKROy73ibLGFcGQ6WVQQweR7bUMfIv7PY5RphLX7yzz17bFgxXQxKlU9ZX/7SxiCR1936qlh6BFuNhNCVxXqObUSZGj+u2HsZKy2AV6l3LmqBiIEq6RJ9jnRNVQP79ZPmk5BboQvG+Y4XRvQCyZz5q+vp5KQxY9rsSiZ64D8w5fXQa4W/wRc6H/N76Pz+BbZYc8xrsVJMCwH0iwt4GtRtWzNVel1r0uhHMw2TAY3QOTYrYqZzjfakxyHfNqN2BFkshV7s9Oy2XhORKz3eLnhiWB2KEzHfB3blQVEICoR8F0l5/FYyESkfWzyfU/ImJRd/YCVADQQVRiSMn43Rse5VPOXlxKS2SYnK134sknM91EawLJJIFWYeIlBji9eEg3jV3emSQ0rJIxbJui9IfZy0B4Zpn+rroWLE7oQcTr51AGa+GKTTMxHOytWErm31mKt+/uWB5ixmT0YDOWXmDVsvhTdspzceI/1GF+o3qYvM52yUruIr6S5cWIgOBtnHsHrZoW2M9BBQyy2uzD5FioxYNCMXaQEw34J4GfnStANGoj1AbqM5crfxU83JyiJVXBAKU3duy0eC8/uW0dvhkQ5Xp/V8LI0erNJXw== michaelintellect2007@gmail.com"
    tags       = {
      name = "test-deployer-key"
    }
  }

]

################## IAM ROLES ################## 
iam_roles = [
  {
    path = "/",
    name = "GlueaccesstoS32Role"
    assume_role_policy_file = "json/role_assumed_policy/glueAssumedRole.json"
    max_sesssion_duration = 3600
  }
]


################## IAM POLICES ################## 
iam_policies = [
  {
    name = "GlueaccesstoS32Policy"
    description = "Glue access policy"
    path = "/"
    policy_file = "json/iam_policies/gluePolicy.json"
    max_sesssion_duration = 3600
  }
]

################## ROLES POLICIES ATTACHMENT ################## 
iam_attachments = [
  {
    role_name = "GlueaccesstoS32Role"
    policy_name = "GlueaccesstoS32Policy"
  }
]

################## ECS CLUSTER ################## 
ecs_clusters = [
  {
    name = "cluster-one"
    tags = {
      name = "clusetr-one-cluster",
      ecsZoneSchdule = "CST"
    }
  }

]
################## ECS TASKS ################## 
ecs_tasks = [
  {
    family = "cluster-one-service"
    network_mode = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu  = 1024
    memory = 2048
    container_definitions = <<DEFINITION
[
  {
    "image": "nginx",
    "cpu": 1024,
    "memory": 2048,
    "name": "hello-world-nginx",
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
DEFINITION
    
  }

]

################## ECS SERVICES ################## 
ecs_services = [
  {
    name = "cluster-one-service"
    cluster_index = 0
    task_definition_index= 0
    desired_count = 1
    launch_type = "FARGATE"
    network_security_groups = ["sg-09ab5aae64e88647d"]
    network_subnet = ["subnet-0f06d354b07122c1a"]
    
  }
]