variable user {
    type = map
    default = {
        sid = 22
        mk = 20
    }
}

variable username {
    type = string
}
output userage {
    value = "my name is ${var.username} and my age is ${lookup(var.user, var.username)}"
}