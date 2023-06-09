

#NIC 
data "azurerm_network_interface" "nic" {
  name                = var.network_interface_name
  resource_group_name = var.resource_group_name
  count  = var.nicpresent ? 1 : 0
}

module "azurerm_network_interface" {
  source = "../azurerm_network_interface"
  count  = var.nicpresent ? 0 : 1
}

#Availability sets
data "azurerm_availability_set" "as" {
  name                = var.availability_set_name
  resource_group_name = data.azurerm_network_interface.nic[0].resource_group_name
  count  = var.aspresent ? 1 : 0
}

#NOTE- Here we are assuming that "MyKeyVault" and "MyResourceGroup" are pre-created resources in the Azure portal and we are referring them here
data "azurerm_key_vault" "kv" {
  name                = "MyKeyVault"
  resource_group_name = "MyResourceGroup"
}

data "azurerm_key_vault_secret" "key_vault_secret" {
  name         = "MyKeyVaultSecret"
  key_vault_id = data.azurerm_key_vault.kv.id
}

module "azurerm_availability_set" {
  source = "../azurerm_availability_set"
  count  = var.aspresent ? 0 : 1
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                  = "WindowsVirtualMachine"
  location              = (var.nicpresent ? data.azurerm_network_interface.nic[0].location : module.azurerm_network_interface[0].resource_group_location)
  resource_group_name   = (var.nicpresent ? data.azurerm_network_interface.nic[0].resource_group_name : module.azurerm_network_interface[0].resource_group_name)
  size                  = var.windows_vm_size
  admin_username        = var.windows_vm_admin_username
  admin_password        = data.azurerm_key_vault_secret.key_vault_secret.value
  network_interface_ids = (var.nicpresent ? [data.azurerm_network_interface.nic[0].id] : [module.azurerm_network_interface[0].network_interface_id])
  availability_set_id   = (var.aspresent ? data.azurerm_availability_set.as[0].id : module.azurerm_availability_set[0].availability_set_id)
  os_disk {
    caching              = var.windows_vm_caching
    storage_account_type = var.windows_vm_storage_account_type

  }

  source_image_reference {
    publisher = var.windows_vm_publisher
    offer     = var.windows_vm_offer
    sku       = var.windows_vm_sku
    version   = var.windows_vm_version
  }

    boot_diagnostics {
   
    storage_account_uri = var.storage_uri
  }
}
