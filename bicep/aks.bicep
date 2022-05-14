@description('Name of environment')
param env string = 'dev'

@description('Default location for all resources')
param location string = resourceGroup().location

var name = 'bicepgoat'

resource aksCluster 'Microsoft.ContainerService/managedClusters@2021-02-01' = {
  name: '${name}-aks-${env}'
  location: location

  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    kubernetesVersion: '1.19.7'
    dnsPrefix: '${name}-${env}'
    enableRBAC: false

    agentPoolProfiles: [
      {
        name: 'default'
        count: 2
        vmSize: 'Standard_D2_v2'
      }
    ]
    addonProfiles: {
      omsagent: {
        enabled: false
      }
    }
  }
}
