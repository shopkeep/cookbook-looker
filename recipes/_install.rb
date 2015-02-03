#
# Cookbook Name:: looker
# Recipe:: _install
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#

looker_run_dir = node['looker']['run_dir']

directory looker_run_dir do
  owner 'looker'
  group 'looker'
end

remote_file "#{looker_run_dir}/looker" do
  source node['looker']['startup_script']
  owner 'looker'
  group 'looker'
  mode 0750
  action :create_if_missing
end

remote_file "#{looker_run_dir}/looker.jar" do
  source node['looker']['jar_file']
  owner 'looker'
  group 'looker'
  mode 0750
  action :create_if_missing
end
