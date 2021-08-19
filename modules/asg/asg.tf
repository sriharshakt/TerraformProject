#################################################################################
# Create launch configuration

resource "tls_private_key" "privkey" {
  algorithm = var.Algorithm
  rsa_bits  = var.Rsa_Bits
}

resource "aws_key_pair" "keypair" {
  key_name   = var.Key_Name
  public_key = tls_private_key.privkey.public_key_openssh
}

resource "aws_launch_configuration" "launchconf" {
  name_prefix          = var.Name_Prefix
  image_id             = var.Image_Id
  instance_type        = var.Instance_Type
  security_groups      = [var.Security_Groups]
  user_data            = var.User_Data
  iam_instance_profile = var.Iam_Instance_Profile
  count                = var.Count
  key_name             = aws_key_pair.keypair.key_name

  # Add Root Volume size 
  root_block_device {
    volume_size = var.Volume_Size
  }

  # Add EBS Volume
  ebs_block_device = var.Ebs_Block_Device

  lifecycle {
    create_before_destroy = var.Create_Before_Destroy
  }
}

resource "aws_autoscaling_group" "asg" {
  name                      = var.Name
  launch_configuration      = aws_launch_configuration.launchconf.name
  vpc_zone_identifier       = [var.subnets]
  max_size                  = var.Max_Subnets
  min_size                  = var.Min_Size
  desired_capacity          = var.Desired_Capacity
  force_delete              = var.Force_Delete
  count                     = var.Count
  target_group_arns         = [var.Target_Group_Arns]
  
  lifecycle {
    create_before_destroy = var.Create_Before_Destroy
  }
}
