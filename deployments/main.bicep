// Creates all infrastructure for Space Game
targetScope = 'subscription' // switch to sub scope to create resource group

@description('Required. Depending on delection other configurations are used.')
@allowed([
  'dev'
  'prd'
])
param environment string = 'prd'

var rg = environment == 'prd' ? json(loadTextContent('prd/rg.json')) : json(loadTextContent('dev/rg.json'))

// @maxLength(11)
// param storageAccountPrefix string = 'bicep'
// var sta = '${storageAccountPrefix}${uniqueString(subscription().id)}'

@description('Deployment of resource groups.')
resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rg.name
  location: rg.location
  tags: rg.tags
}


// resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
//   name: sta
//   location: resourceGroup().location
//   kind: 'StorageV2'
//   sku: {
//     name: 'Premium_LRS'
//     tier: 'Premium'
//   }
// }
