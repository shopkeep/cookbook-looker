#
# Cookbook Name:: looker
# Recipe:: _service
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#
#

looker_home = node['looker']['home']
looker_run_dir = "#{looker_home}/looker"

looker_cfg = "#{looker_run_dir}/lookerstart.cfg"

template looker_cfg do
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
  subscribes :notifications, looker_cfg
end
