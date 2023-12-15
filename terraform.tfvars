# providers.tf
access_key = "XYZZZ....
secret_key = "XYZZZZ..."

# key-pair.tf
instance_type = "t2.micro"

# resources.tf
image_id = "ami-0fc5d935ebf8bc3bc"  # Required ubuntu ami id

# security-group.tf
ports = [22, 80, 443, 3306, 27017]
