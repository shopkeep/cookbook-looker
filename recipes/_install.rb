#
# Cookbook Name:: looker
# Recipe:: _install
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#

directory node['looker']['run_dir'] do
  owner 'looker'
  group 'looker'
end

remote_file node['looker']['local']['startup_script'] do
  source node['looker']['startup_script']
  owner 'looker'
  group 'looker'
  mode 0750
  action :create_if_missing
end

remote_file node['looker']['local']['jar_file'] do
  source node['looker']['jar_file']
  owner 'looker'
  group 'looker'
  mode 0750
  action :create_if_missing
end
