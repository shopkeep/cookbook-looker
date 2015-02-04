#
# Cookbook Name:: looker
# Recipe:: default
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#

node.default['looker']['run_dir'] = "#{node['looker']['home']}/looker"

node.default['looker']['local']['startup_script'] = "#{node['looker']['run_dir']}/looker"
node.default['looker']['local']['jar_file'] = "#{node['looker']['run_dir']}/looker.jar"
node.default['looker']['local']['cfg_file'] = "#{node['looker']['run_dir']}/lookerstart.cfg"

include_recipe 'looker::_user'
include_recipe 'looker::_java'
include_recipe 'looker::_install'
include_recipe 'looker::_service'
