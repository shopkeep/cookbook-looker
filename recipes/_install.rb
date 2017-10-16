# frozen_string_literal: true

#
# Cookbook Name:: looker
# Recipe:: _install
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#

looker_home = node['looker']['home']
looker_run_dir = node['looker']['run_dir']

local_startup_script = "#{looker_run_dir}/looker"
local_jar_file = "#{looker_run_dir}/looker.jar"

group 'looker'

user 'looker' do
  gid 'looker'
  home looker_home
  shell '/bin/sh'
  manage_home true
end

directory node['looker']['run_dir'] do
  owner 'looker'
  group 'looker'
end

remote_file local_startup_script do
  source node['looker']['startup_script_url']
  owner 'looker'
  group 'looker'
  mode 0o750
  action :create_if_missing
end

remote_file local_jar_file do
  source node['looker']['jar_file_url']
  owner 'looker'
  group 'looker'
  mode 0o750
  action :create_if_missing
end
