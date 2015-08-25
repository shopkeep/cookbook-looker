license = Chef::EncryptedDataBagItem.load('newrelic', 'license')

node.default['newrelic']['server_monitoring']['license'] = license['key']

# node.default['looker']['newrelic']['app_name'] = 'Looker'

include_recipe 'newrelic'
# template "/srv/#{node['looker']['newrelic']['app_name']}/shared/config/newrelic.yml" do
#   source 'newrelic.yml.erb'
#   owner 'deploy'
#   group 'deploy'
#   mode '0640'
#   variables({
#     license_key: node['newrelic']['license']['key'],
#     app_name: node['looker']['newrelic']['app_name']
#     })
# end