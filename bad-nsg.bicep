param nsgLocation string
param nsgName string

resource nsg 'Microsoft.Network/networkSecurityGroups@2021-05-01' = {
  name: nsgName
  location: nsgLocation
  properties: {
    securityRules: [
      {
        name: 'badrule'
        properties: {
          access: 'Allow'
          destinationAddressPrefix: '*'
          destinationPortRange: '22'
          direction: 'Inbound'
          priority: 100
          protocol: '*'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
        }
      }
    ]
  }
}
