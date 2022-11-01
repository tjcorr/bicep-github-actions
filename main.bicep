// =========== main.bicep ===========
targetScope = 'subscription'

param location string = deployment().location

resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-bicep-github-actions'
  location: location
}

// Sample NSG designed to raise a security alert. Delete for any real deployment.
module badnsg 'bad-nsg.bicep' = {
  name: 'badnsg'
  scope: rg
  params: {
    nsgName: 'badnsg'
    nsgLocation: location
  }
}
