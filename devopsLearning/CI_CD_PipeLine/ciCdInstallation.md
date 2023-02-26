
# Installing Jenkins
    # Prequisites
        Before contuning this tutorial make sure you have ubuntu machine created and logged in as root(sudo)
        # To install Jenkins on you ubuntu system,follow below steps
            1) Install Java
                Since Jenkins is a Java application,the first step is to install java.Update the package index and install the Java 8
                OpeJDK packagae with the following commands
                  # sudo apt update
                  # sudo apt install openjdk-8-jdk
            
             2) Add Jenkins Debian repository
                Import the GPG keys of the Jenkins repository using the following wget command:
                 # wget -q O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
                 The command above should output OK which means that the key has been successfuly imported and packages from this repository will be considered trusted

                 Next, add the Jenkins repository to the systems with:
                    # sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/> /etc/apt/source.list.d/jenkins.list'
            
            3) Install Jenkins
                Once the Jenkins repostiory is enabled ,update the apt package list and install the latest version of Jenkins by typing
                 # sudo apt update
                 # sudo apt install jenkins
               
                 Jenkins service will automatically start after the installation process is complete.You can verify it by printing the service status:
                # systemctl status jenkins
                You should see something similar to this:
                 Jenkins UI:
            Setting Up Jenkins:
            --------------------
                To set up your new Jenkins installation,open your browse,type your domain or IP address followed by port 8080 make sure you opened port 8080 in AWS securtiy groups,http://your_ip_or_domain:8080
                During the installation,the jenkins installer creates an initial 32-charcter long alphanumeric password.Using the following command to print the password on your termins
                Get the password from below path:
                # sudo cat /var/lib/jenkins/secrets/initialAdminPassword
                Copy the password from your terminal,paste it into the Administrator password field and click Continue and install Selected Plugins

                
# Setting Up Docker in Jenkins Server
    1) Install Docker
        # curl -fsSL get.docker.com | /bin/bash
    2) Add Jenkins User to docker group
        # sudo usermod -aG docker jenkins
    3) Restart Jenkins
        # sudo systemctl restart jenkins

# Setup Kubernetes Cluster
    1) Create 2 ubuntu machines
        # System Requirements
            Master Machine: 2 GB RAM, 2 Core Processor
            Worker Machines: 1 GB RAM, 1 Core Processor
    2) Execute below commands in both master and slave machines.
        =============== COMMANDS FOR MASTER & SLAVE START===============
            sudo apt-get update -y
            sudo apt-get install -y apt-transport-https
            sudo su -

            curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

            cat <<EOF> /etc/apt/sources.list.d/kubernetes.list
            deb https://apt.kubernetes.io/kubernetes-xenial main
            EOF
            apt-get update -y
            swapoof -a
            sed -i '/swap/s/^\(.*\)$/#\1/g' /etc/fstab
            modprobe br_netfilter
            sysctl -p
            sudo sysctl net.bridge.bridge-nf-call-iptables=1
            apt install docker.io -y
            usermod -aG docker ubuntu
            systemctl restar docker
            systemctl enable docker.service
            apt-get install -y kubelet kubeadm kubectl kubernetes-cni
            systemctl daemon-reload
            systemctl start kubelet
            systemctl enable kubelet.service
         =============== COMMANDS FOR MASTER & SLAVE END===============
    3) Execute below commands only in master machine.
            ================== In Master Node Start ===============
            # Execute below commans as root user
           
            kubeadm init
            
            # exit root user and execute as normal user
            
            mkdir -p $HOME/.kube
            sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
            sudo chown $(id -u):$(id -g) $HOME/.kube/config

            kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version) | base64 | tr -d'\n'"

            kubectl get nodes
            kubectl get pods --all-namespaces
            
            # Get Token
            kubeadm token create --print-join-command

            ================== In Master Node END ===============

    4) Execute kubeadm join token in worker nodes to join into cluster.
        ==================In Worker Node Start================
        
        copy kubeadm join token and execute in Worker Nodes to join to cluster
        sudo kubeadm join 172.31.44.30:6443 --token <token_val> --discover-token-ca-cer-has sha256:<val>

# Setup Jenkins Server to deploy applications into K8s Cluster
    We can deploy docker appliacations into k8s cluster from Jenkins using below two approaches
    
    1) Using k8s Continous Deploy Plugin
        a) Go to Jenkins -->Manage Jenkins -->  Manage Plugins --> Available --> Search for   kubernetes Continous Deploy --> Select And Install without restart or with 
 
        b) Add kube config information in Jenkins Credentials
           Jenkins -->Credentials -->Select Kube Config --> copy kubeconfig content from kubernetes cluste
        
        c) Use kubernetes Deploy in pipeline Script
           Ex:
            stage("Deploy To Kubernetes Cluster"){
                KubernetesDeploy(
                    configs:'spingBootMongo.yml',
                    kubeconfigId:'KUBERNETES_CONFFIG',
                    enableCOnfigSubstitution:true
                )
            }
    2) Install kubectl and add kubeconfig in Jenikins server
        a) Install kubectl in jenkins Server
            
            sudo apt-get update -y
            sudo apt-get install -y apt-transport-https
            sudo su -

            curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

            cat <<EOF> /etc/apt/sources.list.d/kubernetes.list
            deb https://apt.kubernetes.io/kubernetes-xenial main
            EOF
            apt-get update -y
            sudo apt-get install -y kubectl
        
        b) Switch to Jenkins user
            sudo -i -u jenkinns
        c) Create .kube folder in Jenkins home directory
            cd ~
            mkdir .kube
        d) Create config file and copy config file content from k8s cluster master machine and save the content
            vim ~/.kube/config
        
        e) We can use kubectl command commands directly in pipe line script, kubectl commands will get ececuted in k8s cluster diectly
            stage("Depliy To Kubernetes Cluster"){
                sh `kubectl apply -f spingBootMongo.yml `
            }

# Create a Job for pipeline in UI:
    1) Loging to Jenkins UI
    2) Get POP up for "Create new Jobs" --> click on it
    3) "Enter an item name" --> Give the job name "sprint-mongo-docker-k8s"
    4) Select --> Pipeline options --> Ok
    5) Pipeline job created 
    6) Click on "Configure" button on right side under "sprint-mongo-docker-k8s"Jobs"
    7) Click on "Pipeline" tab out of below 4
        General     Build Triggers     Advanced Project Options    Pipeline
   
    8) Under Pipeline script write stages which follow during runing pipeline
        1) Stage for GIT:
                node{
                    stage("Git Clone") {
                        <copy the contend of d)>
                    }
                }
                For configuring or integrating GIT with jenkins click on syntax after write it down above groovy script
                
                It'll redirect to "sprint-mongo-docker-k8s" --> Pipeline Syntax page
                Select "Git" options under "Steps" --> "Sample Step:"
                    Provide info under below tab:
                    a) Repository URL: <git_code_url>
                    b) Branch <select_branch>
                    c) Credentials: click on Add and select --> Jenkins  
                            provide username and password of GIT in Jenkins
                            and give ID name --> it act as variable
                    d) Click on "Generate Pipeline Script", copy it and add it under stage of "Git Clone"
    
        2) Next stage configure "maven" 
            If "maven" not installed 
            steps:
                Select -->Jenkins(top tab left side) ---> Manage Jenkins ---> Global Tool Configuration --> Scroll down and click on "Maven" and click on Add Maven and give version under "Name"
            node{
                stage("Git Clone") {
                    <copy the contend of d)>
                }
                stage("Mave Clean Build"){
                    def mavenHome = tool name: "Maven-3.6.1", type:"maven"
                    def mavenCMD = "${mavenHome}/bin/mvn"
                    sh "${mavenCMD} clean package"
                    }
            }
        3) Next stage for build a docker image
            stage("Build Docker Image"){
                sh "docker build -t <Image Tag Name> ."
            }
        4) Next Stage to push the docker image in Docker HUB
            stage("Docker Push"){
                sh "docker login -u <username> -p"
                sh "docker push <Docker Image Tag Name>
            }
            password will configure in Credential how will do for GIT 
            Select "withCredentials: Bind credentials to variables" options 
            under Sample step dropdown