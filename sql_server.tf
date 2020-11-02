{
  "version": 4,
  "terraform_version": "0.13.4",
  "serial": 0,
  "lineage": "58c38241-6a9b-457c-c1e2-51e60095a4f9",
  "outputs": {
    "tfc_example_table_arn": {
      "value": "arn:aws:dynamodb:us-west-1:442203920185:table/terraform-learn-driven-crappie",
      "type": "string"
    }
  },

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

	resource "azure_sql_database_service" "sql-server-db" {
		name                 = "terraform-testing-db"
		database_server_name = azurerm_sql_server.sql_server.name
		edition              = "Standard"
		max_size_bytes       = "5368709120"
	}

}
