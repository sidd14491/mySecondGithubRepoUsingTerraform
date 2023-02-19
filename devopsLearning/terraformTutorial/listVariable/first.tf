output printUserName {
    # value = "Mye first name is ${var.users[0]} second name ${var.users[1]} and third name ${var.users[2]}"
    value = "${join("-->",var.users)}"
}

output helloworldUpper {
    value = "${upper(var.users[0])}"
}

output helloworlLower {
    value = "${lower(var.users[1])}"
}

output helloworlTitle {
    value = "${title(var.users[2])}"
}