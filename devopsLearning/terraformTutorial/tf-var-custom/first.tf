variable age {
    type = number
}

variable name {
    type = string
}

variable enviornmentUsername {
    type = string
}
output printname {
    value = "My name is ${var.name} and my age is ${var.age}"
}

output printValueFromEnviornment {
    value = "I read this name from enviornment variable ${var.enviornmentUsername}"
}