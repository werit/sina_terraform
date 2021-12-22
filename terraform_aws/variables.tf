variable "ext_port" {
  type = number
  description = "Variable representing external port for first nodered container"
  validation {
    condition = var.ext_port > -1 && var.ext_port <= 65535
    error_message = "External port must be in port range from 0 to 65535."
  }
}

variable "container_count" {
  type = number
  default = 1
}