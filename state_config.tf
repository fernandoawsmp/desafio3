terraform {
    backend "s3"{
        bucket ="terraform-bia-fernando-2"
        key ="terraform.tfstate"
        region ="us-east-1"
        profile ="bia"
    }
}

#terraform {
#    backend "local"{
#    }
#}