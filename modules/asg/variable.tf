variable "Count" {
  default = false
}

variable "Algorithm" {
  default = rsa
}

variable "Rsa_Bits" {
  default = 4096
}

variable "Key_Name" {
  default = ""
}
variable "Name_Prefix" {
  default = ""
}

variable "Image_Id" {
  default = ""
}

variable "Instance_Type" {
  default = ""
}
variable "Security_Groups" {
  type = "list"
}

variable "Iam_Instance_Profile" {
  default = ""
}

variable "Volume_Size" {
  default = ""
}

variable "Ebs_Block_Device" {
  default = ""
}

variable "Create_Before_Destroy" {
  default = true
}

variable "Name" {
  default = ""
}

variable "subnets" {
  type = "list"
}

variable "Max_Subnets" {
  default = ""
}

variable "Min_Size" {
  default = ""
}

variable "Desired_Capacity" {
  default = ""
}

variable "Force_Delete" {
  default = ""
}

variable "Target_Group_Arns" {
  default = ""
  type = "list"
}

