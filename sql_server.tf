

provider "azurerm" {
	region = "East Asia"
}

resource "azurerm_resource_group" "resource_group" {
	name     = "test-rg"
	location = "Central US"
}

resource "azurerm_sql_server" "sql_server" {
	name                         = "terraform-testsqlserver"
	resource_group_name          = azurerm_resource_group.resource_group.name
	location                     = azurerm_resource_group.resource_group.location
	version                      = "12.0"
	administrator_login          = "admin"
	administrator_login_password = "Welcome@123"

	tags = {
		environment = "development"
	}
}

resource "azurerm_sql_database" "sql-server-db" {
	name                 = "terraform-testing-db"
	database_server_name = azurerm_sql_server.sql_server.name
	edition              = "Standard"
	max_size_bytes       = "5368709120"
}


