################## VPC SECTION ################## 
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
################## NETWORK INTERFACES SECTION ################## 
network_Interfaces=[
    {
     subnet_id = "subnet-05f64efa3bdeaa750",
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
      subnet_id = "subnet-05f64efa3bdeaa750",
      private_ip = "",
      tags = {
        Name = "Test Server"
      }
    }
]