# Microsoft Azure Fundamentals Certification Course (AZ-900) 

## What is cloud computing
        The practice of using a network of remote servers hosted on the internet to store,
        manage and process data,rather than a local server or a personal computer

            On-Premise                      Cloud Providers
        1) You own the servers              Someone else owns the server
        2) you hire the IT people           Someone else hire the IT people
        3) you pay or rent the real-state   Someone else pays or rent the real state
        4) you take all the risk            You are responsible for configuring the cloud 
                                            service and code,someone else take care of the rest
    
## Trends towards cloud computing from pyhsical 
        1) Dedicated Server: 
            One physical machine dedicated to single a business.Run a single web-app/site
                **Very Expensive,High Maintainence,High Security
        2) Virtual Private Server:
                 One physical machine dedicated to a single business.The physical machine is virtualized into sub-machines.
                 Run multiple web-app/pages
        3) Shared Hosting:
                One physical machine,shared by hunderd of businessess.Relies
                on most tenants under-utilizing their resource.
                **Very cheap,Very Limited
        4) Cloud Hosting:
                Multiple physical machines that act as one system.The system
                is abstracted into multiple cloud services
                ** Flexible,Scalable,Secure,Cost-Effective,High Configurability

## Common Cloud Services:
        A cloud provider can have hundreds of cloud services that are grouped various type of services.
        The four most common types of cloud services for IAAS would be:
            a) Compute:
                Imagine haveing a virtual machine that can run application,program and code
            b) Storage:
                Imagine having a virtual hard-drive that can store files
            c) Networking:
                Imagine that a virtual network being able to define internet 
                connections or network isolations
            d) Database:
                Imagine a virtual database for storing reporting data or a database for general purpose web-application

## What is Azure?
    Microsoft calls their cloud provider service
        Microsof Azure
        Commonly refered to as AZURE
## Benefits of cloud computing
1) Cost-Effective:
    You **pay for what you come**, no up-front cost.Pay-as-you-go(PAYG) thoushands of customers sharing the cost of the resources
2) Global:
    Launch workloads **anywhere in the world**,Just choose a region
3) Secure:
    Cloud providers take care of physical security.**Cloud services can by secure by default** or you have the ability to configure access down to granualr level
4) Reliable:
    data backup,disaster recovery, and data replication and fault tolerence
5) Scalable:
    Increase or decrease resoruces and services based on demand
6) Elastic:
    Automate scaling during spike and drop in demand
7) Current:
    The underlying hardware and managed software is patched,upgraded and replaced by the cloud provider without interruption to you

## Types of Cloud computing
    1) SaaS(Software as a Service) For Customers
        A product that is run and managed by a service provider.Don't worry about how the service is maintained.It just works and remain avialable
        example: salesforce,gmail,office360 etc.
    2) PaaS(Platform as a Service)  For developers
        Focus on the deployment and management of your apps/Don't worry about
        provisioning,configuring or understanding the hardware or OS
        example: googple App engine,horkou,EKS aks etc
    3) IaaS(Infrastructure as a service) For Admins
        The basic building blocks for cloud IT.Provide access to networking feautres,computer and data storage space.
        Don't worry about IT staff,data centres and hardware
        example:AZURE,AWS,GCP,Oracle cloud etc.

## Types of Cloud Computing Responsbilites :
            On-Premise          Iaas                Paas                Saas

           Applications       Applications          Applications       *Applications*       
           Data               Data                  Data               *Data*
           Runtime            Runtime               Runtime            *Runtime*
           Middleware         Middleware            *Middleware*       *Middleware*
           OS                 OS                    *OS*               *OS*
           virtualization     *virtualization*      *virtualization*   *virtualization*    
           Servers            *Servers*             *Servers*          *Servers*
           Networking         *Networking*          *Networking*       *Networking*
           Storage            *Storage*             *Storage*          *Storage*

           Note: Customer Responsible: without asterik(*)
                 CSP(Cloud service provider): with asterik(*)

## Azure Deployment Model:
    1) Public Cloud:
        Everything build on the cloud Provider 
        Also knowns as :Cloud Native
            ====================================
            |  <--> vnet                       |
            |                                  |   
            |   publicSbnt          privateSbnt|
            |      appvm               dbvm    |
            |==================================|   
   
    2) Private Cloud:     
         Everything built on company datacenters
         Also known as On-Premis
         The cloud could be openStacks    
             ==================================
            |  <--> openstack                  |
            |                                  |   
            |   publicSbnt          privateSbnt|
            |      appvm               dbvm    |
            |==================================|                   
    3) Hybrid cloud:
        Using both On-Premise and Cloud Service Provider
         ====================================
            |  <--> vnet                       |
            |                                  |   
            |   publicSbnt          privateSbnt|
            |      appvm               dbvm    |
            |==================================|  
                            |
                        Express Route  (It's make connectivity between private and public)
                            |
              ==================================
            |  <--> openstack                  |
            |                                  |   
            |   publicSbnt          privateSbnt|
            |      appvm               dbvm    |
            |==================================|  

    4) Cross Cloud aka mutli-cloud
        Using Multiple Cloud providers   

        =============               ============             ============
        | Amazon EKS |  <---------->| Azure Arc | <--------->|  GKE     |
        |============               ============             ============


## Total cost ownership(TCO)
    Capex                                                        Opex
    On-premise                                                    CSP
    Following responsbilites take as part of on-premise           Following responsbilites take as part of CSP
     a) Implementation                                                  a) Implementation
     b) configuring                                                     b) configuring
     c) Training                                                        c) Training
     d) Physical security                                            
     e) Hardware
     f) IT professional
     g) Maintainence

    **Note**:
        1) As part of cost-saving CSP(OPEX) is 75% cheaper than on-premise(CAPEX)
        2) From point "c" to "g"  taken care by  CSP in case OPEX

## Capital vs Operational Expenditure
    Capital Expenditure(CAPEX)            |      Operational Expenditure(OPEX)
     Spending money upfront on physical   |           The costs associated with an on-premise
     infrastructure that expense from your|          datacenter that has shifted the cost to the service
     tax  bill over time                  |             provider.The customer only concerned with non-phyiscal  
                                          |        costs
                                          |
      > Server Costs(computers)           |         > Leasing software and customizing features
      > Storage Costs(hard drives)        |         > Training Employess in Cloud Services
      > Network Costs(Rtr,Swtch,firewall) |         > Paying for cloud support
      > Backup and Archive costs          |         > Billing based on cloud metrics
      > Disaster Recovery Costs           |               a) compute storage
      > Datacenter Costs(Rent,Cooling,    |               b) storage Usage
                physical security)        |
      > Techincal Personal                |

## Cloud Architecture Terminology
    1) Availability: 
        Your ability to ensure a service remains available(HA)
    2) Scalability:
        Your responsbility to grow rapidly or unimpeded(unblocked)
    3) Elasticity:
        Your ability to shrink and grow to meet the demand
    4) Disaster Recovery:
        Your ability to recover from a failure
    5) Fault Tolerence:
        Your ability to prevent a failure

## Azure Fundamentals
    a) High Availability:
        Your ability for ensure service to remain available by ensuring there is
        *no single point of failure and/or ensure a certain level of performance
                               
                                        -----------------------
                                        |                      |
                                        |     --------------   |
                                        |     |vm1     AZ1  |  |
                                        |      -------------   |
                                        |                      |
        --------          ------        |     --------------   |
        |cloud  | ------->| AZB |------>|     |vm2     AZ2  |  |
        --------           ------       |     --------------   |
                                        |                      |
                                        |     --------------   |
                                        |     |vm3     AZ3  |  |
                                        |     --------------   |
                                        -----------------------

        Azure Load Balancer(AZB):
            A load balancer allow you to evenly distribute traffic to multiple
            servers in one or datacenters. If datacenters or servers become unavailble
            or unhealthy the load balancer will route the traffic to only available
            datacenters with servers
        Note:
            Running your workload across multiple Availablitiy Zones(AZ) ensure that if 1 or 2
            AZs become unavailble your service / applications remains available
    
    b) High Scalability:
        Your ability to increase your capacity based on the increasing demand of traffic,
        memory and computing power
         
        There are two types of scalibility:
            a) Vertical Scaling(Scaling up):
                upgrade to bigger server means increase memory,cpu etc
            b) Horizontal Scaling(Scaling out):
                Add more server of the same size
    c) High Elasiticty
        Your ability to automaitcally increase or decrease your capacity based
        on the current demand of traffic,memory and computing power

        Horizontal Scaling:
            Scaling Out: Add more servers of the same size
            Scaling in: Removing more servers of the same size
        
        Vertical Scaling: It is generally hard for traditional architecture so you'll
        usually only see horizonatal scaling described with Elasticity
          Ex: If you increase or decrease db then it's chance to loose the data

        How to achive in AZURE?
            Azure VM Scale Sets:
                Automatically increase or decrease in response to demand or 
                defined schedule
            SQL Server Stretch Database:
                Dynamically stretch warm and cold transactional data from 
                Microsoft SQL server 2016 to Microsoft Azure

    d) High Durability:
        Your ability to  recover from a disaster and prevent the loss of data
        Solutions that recover from a disaster is knowns as Disaster Recovery(DR)

## The Evolution of Computing
    1) Dedicated Server:
                                                ============================================
                                                |        ------------------------           |
                                                |        |                      |           |
                                                |        |      Wasted Space    |           |
                                                |        |                      |           |
                                                |          ----------------------           |
                                                |                                           |
                                                | APP            APP               APP      |
                                                | ----------------------------------------  |
                                                |  |            Host Operating System     | |
                                                |  ---------------------------------------  |
                                                |===========================================
                    a) A physical server wholly utilized by a single customer
                    b) You have to guess your capacity,you'll overpay for an underutilized server
                    c) Upgrading beyond your capacity will be slow and expensive
                    d) You limited by our Operating System
                    e) Multiple apps can result in conflicts in resource
                    f) You have a * guarntee of security,privacy and full utility of underlying resource*
            
            2) VMs
                _________________________________________
                |   ____________          ____________   |
                |  | ---------  |        | ---------  |  |     a) You can run multiple virtual machine on one machine 
                |  | | Wasted | |        | | Wasted | |  |     b) Hypervisor is the software layer that lets you the VMs
                |  | |  Space | |        | |  Space | |  |     c) A Phyiscal server shared by multiple customer
                |  | |        | |        | |________| |  |     d) You are pay for a fraction of the server
                |  |  --------- |        |   _______  |  |     e) You'll overpay for an underutilized Virtual Machine
                |  |   _______  |        |   |APP   | |  |     f) You are limited by your Guest Operating System
                |  |   |APP   | |        |   |______| |  |     g) Multiple apps on a singl Virtual Machine can result in conflicts in resource sharing
                |  |   |______| |        |   _______  |  |
                |  |  _________ |        |   |APP   | |  |
                |  | | Guest Os||        |   |______| |  |
                |  | |_________||        |  _________ |  |
                |  |____________|        | | Guest Os||  |
                |                        | |_________||  |
                |                        |____________|  |
                |       VM                   VM          | 
                | ____________________________________   |
                | |           Hypervisor             |   |
                | |__________________________________|   |
                |  ___________________________________   |
                | |           Host Operating System   |  |
                | |___________________________________|  |
                |________________________________________|

                