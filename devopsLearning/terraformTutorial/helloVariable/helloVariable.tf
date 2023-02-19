# variable username {}
output printName {
    value = "Hello, ${var.username}, your age is ${var.age}"
}
# Passing command line arguments in terraform