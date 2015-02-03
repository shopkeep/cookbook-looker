#
# Cookbook Name:: looker
# Recipe:: _service
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#
#

looker_cfg_file = "#{node['looker']['run_dir']}/lookerstart.cfg"

template looker_cfg_file do
  source 'lookerstart.cfg.erb'
  owner 'looker'
  group 'looker'
  mode 0640
  variables(
    args: node['looker']['startup_args']
  )
  action :create
  notifies :restart, 'service[looker]'
end

service 'looker' do
  action :start
  start_command "su looker -c 'cd ~looker/looker && ./looker start'"
  restart_command "su looker -c 'cd ~looker/looker && ./looker restart'"
  stop_command "su looker -c 'cd ~looker/looker && ./looker stop'"
  status_command "su looker -c 'cd ~looker/looker && ./looker status'"
  supports :restart => true, :status => true
  subscribes :notifications, looker_cfg_file
end
