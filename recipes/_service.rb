#
# Cookbook Name:: looker
# Recipe:: _service
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#

looker_run_dir = node['looker']['run_dir']
looker_cfg_file = "#{looker_run_dir}/lookerstart.cfg"
looker_cmd = "su looker -c 'cd #{looker_run_dir} && ./looker"

template looker_cfg_file do
  source 'lookerstart.cfg.erb'
  owner 'looker'
  group 'looker'
  mode 0640
  variables(
    looker_args: node['looker']['LOOKERARGS'],
    java_args: node['looker']['JAVAARGS']
  )
  action :create
  notifies :restart, 'service[looker]'
end

service 'looker' do
  action :start
  start_command "#{looker_cmd} start'"
  restart_command "#{looker_cmd} restart'"
  stop_command "#{looker_cmd} stop'"
  status_command "#{looker_cmd} status'"
  supports restart: true, status: true
  subscribes :notifications, looker_cfg_file
end
