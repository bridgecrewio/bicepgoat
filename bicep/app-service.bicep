@description('Name of environment')
param env string = 'dev'

@description('Default location for all resources.')
param location string = resourceGroup().location

var name = 'bicepgoat'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: '${name}-app-service-plan-${env}'
  location: location
  sku: {
    name: 'S1'
  }
  kind: 'app'
}

resource app 'Microsoft.Web/sites@2020-06-01' = {
  name: '${name}-app-service-${env}'
  location: location
  kind: 'app'
  properties: {
    httpsOnly: false
    serverFarmId: appServicePlan.id
  }

  resource configWeb 'config' = {
    name: 'web'

    properties: {
      minTlsVersion: '1.1'
      remoteDebuggingEnabled: true
    }
  }
  resource configAuth 'config' = {
    name: 'authsettings'

    properties: {
      enabled: false
    }
  }
}
