
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
