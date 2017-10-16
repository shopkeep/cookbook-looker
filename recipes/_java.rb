# frozen_string_literal: true

#
# Cookbook Name:: looker
# Recipe:: _java
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#

if node['looker']['install_java']
  node.set['java']['oracle']['accept_oracle_download_terms'] = true
  node.set['java']['install_flavor'] = 'oracle'
  node.set['java']['jdk_version'] = 8
  include_recipe('java')
end
