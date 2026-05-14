// modules/resourceGroup.bicep
param rgName string
param location string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: myrg
  location: WEST US
}

output rgName string = rg.name
