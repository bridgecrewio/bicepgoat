@description('Name of environment')
param env string = 'dev'

@description('Default location for all resources.')
param location string = resourceGroup().location

var name = 'bicepgoat'

resource keyVault 'Microsoft.KeyVault/vaults@2021-04-01-preview' = {
  name: '${name}-vault-${env}'
  location: location

  properties: {
    tenantId: subscription().tenantId

    sku: {
      name: 'premium'
      family: 'A'
    }
    networkAcls: {
      defaultAction: 'Allow'
      bypass: 'AzureServices'
    }
  }
}

resource secret 'Microsoft.KeyVault/vaults/secrets@2021-04-01-preview' = {
  parent: keyVault
  name: '${name}-secret-${env}'

  properties: {
    value: 'some value'
  }
}
