param location string = resourceGroup().location
param acrName string
param acrPoolSubnetId string = ''
param tags object = {}

resource acr 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' existing =  {
  name: acrName
}

resource acrPool 'Microsoft.ContainerRegistry/registries/agentPools@2019-06-01-preview' = {
  name: 'private-pool'
  location: location
  tags: tags
  parent: acr
  properties: {
    count: 1
    os: 'Linux'
    tier: 'S1'
    virtualNetworkSubnetResourceId: acrPoolSubnetId
  }
}
