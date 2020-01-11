
variable "image" {  default = "ubuntu-os-cloud/ubuntu-1604-lts" }

variable "machine_type" {  
    type = "map"

    default = {
     "dev" = "n1-standard-1"
     "prod" = "production_box_wont_work"
     }
}
variable "name_count" { default = ["server-1","server-2","server-2"]}

  


