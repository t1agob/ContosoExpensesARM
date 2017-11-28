# ContosoExpensesARM
The purpose of this template is to deploy the complete Contoso Expenses aplication to Azure. The following resources will be deployed.
* 2 Web Applications (Web and API)
* 1 Function App
* 2 Storage Accounts
* 1 SQL Database
* 1 SendGrid Email 

This template uses GitHub integration to deploy to the Azure WebApps and Azure Function. It will also restore the database using a _.bacpac_ file.

# Steps do deploy
1. [Run requirements script](#run-requirements-script)
2. [Deploy the template](#deploy-the-template)
3. [Configure SendGrid](#configure-sendgrid)


## Run requirements script
Folder _pre-reqs_ contains a PowerShell script that you need to run in order to copy the database to a storage account in your subcription.

**Run the script and make sure to copy the output** somewhere since it will be used in the template deployment phase.

````POWERSHELL
C:\..\ContosoExpensesARM\pre-reqs> .\Create-Storage-Account-And-Copy-DB.ps1

Successfully Signed-in
Created resource group
Created storage account
Created storage container
Successfully uploaded .bacpac to storage account

 ----                  DEPLOYMENT INFORMATION                  ----
 - RESOURCE GROUP NAME: ContosoExpensesARM1271674349
 - STORAGE ACCOUNT NAME: sqlimport678651702
 - STORAGE ACCOUNT KEY: sZ+1FFaHRvoHJYsSlvv5ZK1IetCPWY8LiGLM0hjmwfJWPke5LHz5d2vHc5Q9EOPRmeXp+4AADVAUq5UG7HKkWA==
 - KEEP THIS INFORMATION AS IT WILL BE REQUIRED FOR DEPLOYING -
````


## Deploy the template
To deploy the ARM template click the _Deploy to Azure_ button. Fill in the required fields.

> Make sure the information copied previously is used in the this deployment phase.

[![Deploy to Azure](https://azuredeploy.net/deploybutton.svg)](https://azuredeploy.net/)

## Configure SendGrid

