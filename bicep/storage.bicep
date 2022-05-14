@description('Name of environment')
param env string = 'dev'

@description('Default location for all resources.')
param location string = resourceGroup().location

var name = 'bicepgoat'

resource datadisk 'Microsoft.Compute/disks@2021-12-01' = {
  name: '${name}-disk-${env}'
  location: location
  sku: {
    name: 'Standard_LRS'
  }

  properties: {
    diskSizeGB: 10
    encryptionSettingsCollection: {
      enabled: false
    }
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-01-01' = {
  name: '${name}-sa-${env}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_GRS'
  }

  properties: {
    supportsHttpsTrafficOnly: false

    networkAcls: {
      bypass: 'None'
      defaultAction: 'Deny'
    }
  }

  resource configWeb 'config' = {
    name: 'web'

    properties: {
      minTlsVersion: '1.1'
      remoteDebuggingEnabled: true
    }
  }
}
