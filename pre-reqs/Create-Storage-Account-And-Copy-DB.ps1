# VARIABLES
$resourcegroupname = "ContosoExpensesARM$(Get-Random)"
$location = "westeurope"
$storageaccountname = "sqlimport$(Get-Random)"
$storagecontainername = "importcontainer"
$bacpacfilename = "ContosoExpensesDB.bacpac"

# Login in Azure
Login-AzureRmAccount

# Create a resource group
$resourcegroup = New-AzureRmResourceGroup -Name $resourcegroupname -Location $location

# Create a storage account 
$storageaccount = New-AzureRmStorageAccount -ResourceGroupName $resourcegroupname `
    -AccountName $storageaccountname `
    -Location $location `
    -Type "Standard_LRS"

# Create a storage container
$storagecontainer = New-AzureStorageContainer -Name $storagecontainername `
-Context $(New-AzureStorageContext -StorageAccountName $storageaccountname `
    -StorageAccountKey $(Get-AzureRmStorageAccountKey -ResourceGroupName $resourcegroupname -StorageAccountName $storageaccountname).Value[0])

# Download sample database from Github
Invoke-WebRequest -Uri "https://github.com/t1agob/ContosoExpensesARM/raw/master/database/ContosoExpensesDB.bacpac" -OutFile $bacpacfilename

# Upload sample database into storage container
$storageaccountkey = $(Get-AzureRmStorageAccountKey -ResourceGroupName $resourcegroupname -StorageAccountName $storageaccountname).Value[0]
Set-AzureStorageBlobContent -Container $storagecontainername `
-File $bacpacfilename `
-Context $(New-AzureStorageContext -StorageAccountName $storageaccountname `
    -StorageAccountKey $storageaccountkey)

# Output storage account name and key
Write-Host " ----              STORAGE ACCOUNT INFORMATION             ---- " -f Yellow
Write-Host " STORAGE ACCOUNT NAME: " -NoNewline; Write-Host "$storageaccountname" -f Red
Write-Host " STORAGE ACCOUNT KEY: " -NoNewline; Write-Host "$storageaccountkey" -f Red
Write-Host " - KEEP THIS INFORMATION AS IT WILL BE REQUIRED FOR DEPLOYING - " -f Yellow