# Today we will be learning how to write the resource blocks. 

// Creating a Virtual Network using Resource Block

/*
Subcription
Resoruce group name
name
region
one subnet is required --- Not mandate
CIDR - Ip address
*/

resource "azurerm_resource_group" "rg02" {
    name = "rg-dev-hdfc-bank-app"
    location = "eastus2"   #"South India"
    tags = {
        Environment = "testing"
    }
}


resource "azurerm_virtual_network" "dev_vnet" {
    name = "dev-hdfc-bank-vnet-demo-app"
    resource_group_name = azurerm_resource_group.rg02.name
    location = azurerm_resource_group.rg02.location   #"eastus"   #"south india"
    address_space = ["10.0.0.0/16"]
    dns_servers = ["192.168.0.1", "172.0.0.0", "10.0.0.0"]
    tags = {
        "Environment" = "Development"
        "Architect"   = "Rinkesh"
        "Product Owner" = "Hdfc bank"
    }

    # #Dynamic blocks
    # subnet {
    #     name = "dev-hdfc-bank-vnet-subnet-01"
    #     address_prefixes = ["10.0.1.0/24"]
    # }
}


resource "azurerm_subnet" "dev01" {
    name = "dev-hdfc-bank-vnet-subnet-01"
    resource_group_name = azurerm_virtual_network.dev_vnet.resource_group_name
    virtual_network_name = azurerm_virtual_network.dev_vnet.name
    address_prefixes = ["10.0.1.0/24"]
}

# To login we need to run powershell commands
# az login
# az account show
# az subscrption set --subscrptionID
# Arguments will also have Required & Optional 
