# Running terraform
    terraform plan
# Passing command line argument in terraform
    terraform plan -var "variable=value"
# Keywords in terraform:
    a) output
    b) variable
    c) value
    d) type
    e) provider
    f) resource
    g) default
# File extension in terraform
    1) <filname>.tf
    2) <vriable_filename>.tf
    3) <value_filenam>.tfvars
    4) <state_manintain_filename>.tfstate
    5) <state_manintain_filename_for_backup>.tfstate.backup
# command in terraform:
    1) terraform plan --> tfstate --> <file>.tf
    2) terraform apply
    3) terraform destroy
    4) terraform init
    5) terraform console
    6) terraform fmt
    7) terraform output
    8) terraform validate
    9) terraform providers
    10) terraform refresh
# concept in terraform
    a) output --> this is same as print in python to print output value.
        syntax:
            output <name> {
                value = "hello sid"
            }
    b) for defining multiple block in terraform file
        syntax:
            output <name1> {
                value = "hello sid"
            }
            output <name2> {
                value = "hello sid"
            }
    c)  We can define multiple terraform file inside one directory:
        like:
           #  ls ../helloWorldFileDestructure 
            abc.tf    first.tf  second.tf third.tf
        when we run "terraform plan" it'll run all file in alphabetical order
           
    d) variable --> for declaring a variable 
        syntax: 
            variable <variableName> {}
        # When we did't set the default value of variable, we need to pass the value in prompt
            like: terraform plan -var "variable=value"
        
        # We can also assing the default value to variable using "default" keyword inside "variable"
        block
            syntax: 
                variable <variableName> {
                    default = "world"
                }
                in this case we did't need to pass the value as command line argument,it'll take
                value from "default"
            
    e) Accessing the value inside a "output" keyword use "${var.anyVariableName}"
        # syntax:
            output printName {
                value = "Hello, ${var.username} and age is ${var.age}"
            }
   
    f) We can also pass the multiple command line argument in "terraform plan" command
        terraform plan -var "variable=value1" -var  "variable=value2"
        terraform plan -var "variable=['value1']" --> list 
   
    g) Types:
        terraform using following types to declare a dataTtype:
            1) Strings : declare --> "sid"
            2) Numbers : declare --> 2.34
            3) Bools : declare --> true, false
            4) Null : declare --> null
            5) List/Tuple : declare --> ["a", 12, true]
            6) Maps/Object : declare --> {<KEY>:<VALUE>}
        
        # Syntax for declaring variable with type:
            variable <variable_name> {
                type = <int,string,list,tuple,map,object,bool>
                value = <variable value>
            }
   
    h) How to define variable value:
        for defining value for variable we can define under:
            # terraform.tvars --> under this file we can define multiple value instead of   passing command-line or declare default value
                ** Terraform by default it's read from a "terraform.tvars" file
            # We can also defined customized value file like:
                   development.tfvars, staging.tfvars, production.tfvars
                ** For reading customized tfvars file we need to run below command
                # terraform plan -var-file=development.tfvars --> Reading from development
                # terraform plan -var-file=staging.tfvars --> Reading from staging
                # terraform plan -var-file=production.tfvars --> Reading from production
    
    i) how to read from enviornment variable
        We can also read value from enviornment variable
        Need to export variable with prefix "TF_VAR_<variableName>
        Steps:
            1) export TF_VAR_username=mkjha

    
    j) How we can automate public cloud or any other things via using terraform
        Steps:
            1) First we need to check in below link which "provider" terrafrom support
                 https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
                Suppose we take an example of "github"
                Select a "github" provider.
                
                syntax:
                    provider <provider_name> {

                    }
                Now we want to create anything releated to "github" provider
                we need to define under "resource" keyword and that value and attribute(parameters) we'll get it 
                from "github" provider page.

                syntax:
                    resource <Provider_resource_name>{

                    }
                And define all the resource which we want create 
            
            2) Execute below command to install the provider moudule or plugin
                This command will read the terraform script file and install the plugin which is not avaiable inside ".terraform" file
                And ".terraform"  this file creatd during initaliaztion time
                # terraform init
            
            3) Execute below command after step-2
                This command will give info what things we need to create by reading from 
                terraform.tfstate file and compare with <terraformScript>.tf file
                # terraform plan
            
            4) Execute below command after step-3
                this command will apply the configuration on "provider" what we define in <terraformScript>.tf file
                # terraform apply
                
            5) After succesfully execution of step-4 it'll create below file
                    # terraform.tfstate
                    this file store the state what we are doing in terraform script
           
            6) For deleting the all the resource which we have create we used below command
                    # terraform destroy
                For deleting individual resource we'll use below command
                    # terrafrom destroy --target  <resource_type>.<resource_name>
            
            7) How we can maintain the state between teraform and cloud provider.
                Suppose that if anyone has changes manually in provider and that entry 
                not availabel in "terraform.tfstate" 
                For maintaining the state need to execute below command
                    # terraform refresh     
       
            ** NOTE ** Always run "terraform validate" command to make sure that script is syntactically correct then execute  terraform "apply or destroy" command
        
        h) How to get output of "terraform apply" command
            Get from "Attribute Refrence"
            syntax:
                <resource_name>.<resource_value>.<attribute_name>
        
        i) How to enable debug level in terraform?
            Export below as an enviornment variable
            # export TF_LOG=DEBUG
        
        j) How we can create AWS services through terraform: 
            Create an IAM account.
                Add Administrative policy after creation of IAM account
