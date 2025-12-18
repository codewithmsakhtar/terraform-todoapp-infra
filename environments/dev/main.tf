locals {
  common_tags = {
    
    "managedby"= "terraform"
    "owner" = "devopsteam"
    "environents"= "dev"
}
}
module "rg"{
source = "../../modules/azurerm_resource_group"
rg_name = "rg-dev-todoapp"
location = "westus"
rg_tags = local.common_tags
}


module "stg"{
    depends_on = [ module.rg ]
source = "../../modules/azurerm_storage_account"
rg_name = "rg-dev-todoapp"
location = "westus"
stg_name = "stgdevtodoapp"
tags = local.common_tags
}

module "key_vault"{
source = "../../modules/azurerm_key_vault"
rg_name = "rg-dev-todoapp"
location = "westus"
kv_name = "kv-dev-todoapp"
}

module "sql_db"{
    depends_on = [ module.rg,module.sql_server ]
source = "../../modules/azurerm_data_base"
server_id = module.sql_server.server_id
location = "westus"
tags = local.common_tags
sqldb_name = "sqldb-dev-todoapp"
}



module "acr"{
    depends_on = [ module.rg ]
source = "../../modules/azurerm_acr"
rg_name = "rg-dev-todoapp"
location = "westus"
acr_name = "acrdevtodoapp"
tags = local.common_tags
}

module "sql_server"{
    depends_on = [ module.rg ]
source = "../../modules/azurerm_db_server"
rg_name = "rg-dev-todoapp"
location = "westus"
server_name = "sqlserver-dev-todoapp"
tags = local.common_tags
admin_username ="devopsadmin"
admin_password ="Password@123"
}

module "aks" {
    depends_on = [ module.rg ]

    source = "../../modules/azurerm_aks_cluster"
  location ="westus"
  aks_name ="aks-dev-todoapp"
  rg_name = "rg-dev-todoapp"
  dns_prefix = "aks-dev-todoapp"
   tags = local.common_tags
}