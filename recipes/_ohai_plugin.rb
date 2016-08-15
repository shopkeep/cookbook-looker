#
# Cookbook Name:: looker
# Recipe:: ohai_plugin
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'chef-sugar::default'

at_compile_time do
  ohai_plugins_path = '/etc/chef/ohai_plugins'
  Ohai::Config[:plugin_path] << ohai_plugins_path

  directory '/etc/chef' do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
    not_if { ::File.directory?('/etc/chef') }
  end

  directory ohai_plugins_path do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end

  ohai 'reload_looker' do
    plugin 'looker'
    action :nothing
  end

  template "#{ohai_plugins_path}/looker.rb" do
    source 'plugins/looker.rb.erb'
    owner 'root'
    group node['root_group']
    mode '0755'
    notifies :reload, 'ohai[reload_looker]', :immediately
  end
end

include_recipe 'ohai::default'
