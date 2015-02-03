#
# Cookbook Name:: looker
# Recipe:: default
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#

looker_home = node['looker']['home']
looker_run_dir = "#{looker_home}/looker"

startup_script = "#{looker_run_dir}/looker"
jar_file = "#{looker_run_dir}/looker.jar"

directory "#{looker_home}/looker" do
  owner 'looker'
  group 'looker'
end

remote_file startup_script do
  source node['looker']['startup_script']
  owner 'looker'
  group 'looker'
  mode 0750
  action :create_if_missing
end

remote_file jar_file do
  source node['looker']['jar_file']
  owner 'looker'
  group 'looker'
  mode 0750
  action :create_if_missing
end
