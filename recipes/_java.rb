#
# Cookbook Name:: looker
# Recipe:: default
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#

node.set['java']['install_flavor'] = 'oracle'
node.set['java']['oracle']['accept_oracle_download_terms'] = true
node.set['java']['jdk_version'] = 7

include_recipe 'java'
