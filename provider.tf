# terraform {
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = "4.29.0"
#     }
#   }
# }

# provider "azurerm" {
#   # Configuration options
# }


terraform {
    required_version = "1.12.0"
    required_providers {
        azurerm = {        
            source = "hashicorp/azurerm"
            version = ">=4.14.0"    #"4.29.0"  #
        }
    }
}

provider "azurerm" {
    features {}
    subscription_id = "0f87b7f3-b8ff-4c25-b09a-901f6869202e"
}

























