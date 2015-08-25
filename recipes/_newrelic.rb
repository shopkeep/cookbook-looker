license = Chef::EncryptedDataBagItem.load('newrelic', 'license')

node.default['newrelic']['server_monitoring']['license'] = license['key']

include_recipe 'newrelic'
