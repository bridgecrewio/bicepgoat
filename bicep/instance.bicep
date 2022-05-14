@description('Name of environment')
param env string = 'dev'

@description('Default location for all resources.')
param location string = resourceGroup().location

var name = 'bicepgoat'

resource existingVnet 'Microsoft.Network/virtualNetworks@2021-02-01' existing = {
  name: '${name}-vnet-${env}'
}

resource existingSubnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' existing = {
  parent: existingVnet
  name: '${name}-subnet-${env}'
}

resource nic 'Microsoft.Network/networkInterfaces@2021-05-01' = {
  name: '${name}-nic-${env}'
  location: location

  properties: {
    ipConfigurations: [
      {
        name: 'internal'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: existingSubnet.id
          }
        }
      }
    ]
  }
}

resource linuxVm 'Microsoft.Compute/virtualMachines@2020-06-01' = {
  name: '${name}-linux-${env}'
  location: location

  properties: {
    hardwareProfile: {
      vmSize: 'Standard_F2'
    }
    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
      }
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '16.04-LTS'
        version: 'latest'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
    osProfile: {
      computerName: '${name}-linux-${env}'
      adminUsername: 'adminuser'
      adminPassword: 'adminpass'
      linuxConfiguration: {
        disablePasswordAuthentication: false
      }
    }
  }
}
