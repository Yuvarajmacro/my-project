param location string
param rgName string

module rg './modules/resourceGroup.bicep' = {
  name: 'rgDeploy'
  params: {
    rgName: rgName
    location: location
  }
}

module storage './modules/storage.bicep' = {
  name: 'storageDeploy'
  params: {
    storageName: 'st${uniqueString(rgName)}'
    location: location
  }
}

module vm './modules/vm.bicep' = {
  name: 'vmDeploy'
  params: {
    vmName: 'vm-${rgName}'
    location: location
    adminUsername: 'azureuser'
    adminPassword: 'Password123!' // Use KeyVault in real scenario
  }
}

module kv './modules/keyvault.bicep' = {
  name: 'kvDeploy'
  params: {
    kvName: 'kv-${uniqueString(rgName)}'
    location: location
  }
}
