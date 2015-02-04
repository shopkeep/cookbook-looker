#
# Cookbook Name:: looker
# Recipe:: default
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#

node.default['looker']['run_dir'] = "#{node['looker']['home']}/looker"

include_recipe 'looker::_java'
include_recipe 'looker::_install'
include_recipe 'looker::_service'
