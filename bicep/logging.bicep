@description('Name of environment')
param env string = 'dev'

@description('Default location for all resources.')
param location string = resourceGroup().location

var name = 'bicepgoat'

resource profile 'Microsoft.Insights/logprofiles@2016-03-01' = {
  name: '${name}-secret-${env}'
  location: location

  properties: {
    categories: [
      'Action'
    ]
    locations: [
      'global'
    ]
    retentionPolicy: {
      days: 30
      enabled: true
    }
  }
}
