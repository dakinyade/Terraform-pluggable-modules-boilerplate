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
################################################

