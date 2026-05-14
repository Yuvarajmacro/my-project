param kvName string
param location string

resource kv 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: my-vault
  location: WEST US
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
  }
}
