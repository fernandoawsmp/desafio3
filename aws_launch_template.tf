data "aws_ssm_parameter" "ecs_node_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2023/recommended/image_id"
}

resource "aws_launch_template" "ecs_ec2" {
  name_prefix            = "cluster-bia-web-"
  image_id               = data.aws_ssm_parameter.ecs_node_ami.value
  instance_type          = "t3.medium"
  vpc_security_group_ids = [ aws_security_group.bia_ec2.id ] 
  iam_instance_profile { arn = aws_iam_instance_profile.ecs_node.arn }
  monitoring { enabled = false }

  user_data = base64encode(<<-EOF
      #!/bin/bash
      echo ECS_CLUSTER=${aws_ecs_cluster.cluster-bia.name} >> /etc/ecs/ecs.config;
    EOF
  )
}

resource "aws_launch_template" "ecs-s_ec2" {
  name_prefix            = "cluster-bia-webs-"
  image_id               = data.aws_ssm_parameter.ecs_node_ami.value
  instance_type          = "t3.medium"
  vpc_security_group_ids = [ aws_security_group.bia_ec2.id ] 
  iam_instance_profile { arn = aws_iam_instance_profile.ecs_node.arn }
  monitoring { enabled = false }

  user_data = base64encode(<<-EOF
      #!/bin/bash
      echo ECS_CLUSTER=${aws_ecs_cluster.cluster-bias.name} >> /etc/ecs/ecs.config;
    EOF
  )
}







