#
# Cookbook Name:: looker
# Recipe:: default
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#

looker_home = node['looker']['home']
looker_init_script = "#{looker_home}/looker/looker"

directory "#{looker_home}/looker" do
  owner 'looker'
  group 'looker'
end

cookbook_file looker_init_script do
  source 'looker'
  cookbook node['looker']['file_cookbook']
  owner 'looker'
  group 'looker'
  mode 0750
  action :create_if_missing
end

cookbook_file "#{looker_home}/looker/looker.jar" do
  source 'looker.jar'
  cookbook node['looker']['file_cookbook']
  owner 'looker'
  group 'looker'
  mode 0750
  action :create_if_missing
end
