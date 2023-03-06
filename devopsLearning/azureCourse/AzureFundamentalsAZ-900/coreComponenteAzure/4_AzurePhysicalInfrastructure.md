# Describe Azure physical infrastructure
    Throughout your joureny with Microsoft Azure,you'll hear and use terms like:
    - Regions
    - Availability Zones
    - Resources
    - Subscription and many more

    This modules focus on the core architectural components of Azure. The core architectural components of 
    Azure may be broken into two main groupings: 
        1) physical infrastructure 
        2) managmenet infrastructure

# Physical Infrastructure
    The physical infrastrucutre of Azure start with datacenters.Conceptually,the dataceters are the same as large
    corporate dataceters. They're facilites with resources arranged in racks with dedicated power,cooling and networking
    infrastrucutre

    As a global provider, Azure has datacenters around the world.However these individual datacenters aren't directly accessible. Datacenters are grouped into Azure Regions or Azure Availability Zones that are designed to help you
    achieve resiliency and reliability for your business-critical

# Regions
    A region is a geographical area on the planet that contains at least one, but potentially multiple datacenters 
    are nearby and networked together with a low-latency netowrk. Azure intelligently assigns and controls the resources within each region to ensure workloads are appropriately balanced

    When you deploy a resource in Azure you'll often need to choose the region where you want your resource deployed.

    *Note:
        Some services or virtual machine(VM) features are only available in certain regions,such as specific VM sizes or
        storage type.
        There are also some global Azure services that don't require you to select a particualr region,such as
        Azure Active Directory ,Azure Traffic Manager and Azure DNS

# Availability Zones
    Availability zones are physically separate datacenters within an Azure region.
    Each avialability zone is made up of one or more datacenters equipped with
    independent power,coolinig and networking. An availability azone is set up to be an
    isolated boundary. If one zone goes down, the othe continues working. Availablity zones are connected through high-speed,provae fiber-optic networks.
             
  ![Alt Text](Images/availability-zones-c22f95a3.png)
 
   ## Use availability zones in your apps
        You want to ensure your services and data are redundant so you can protect your information
        in case of failure.When you host your infrastructure,setting up your own redundancy
        requires that you create duplicate hardware enviornments.Azure can help make your app highly
        available through availability zones

