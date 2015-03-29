#
# Cookbook Name:: looker
# Recipe:: ohai_plugin
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#

ohai 'reload_looker' do
  plugin 'looker'
  action :nothing
end

template "#{node['ohai']['plugin_path']}/looker.rb" do
  source 'plugins/looker.rb.erb'
  owner 'root'
  group node['root_group']
  mode '0755'
  notifies :reload, 'ohai[reload_looker]', :immediately
end

include_recipe 'ohai::default'
