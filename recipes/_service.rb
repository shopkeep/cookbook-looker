#
# Cookbook Name:: looker
# Recipe:: default
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#

service 'looker' do
  action :start
  start_command "su looker -c 'cd ~looker/looker && ./looker start'"
  restart_command "su looker -c 'cd ~looker/looker && ./looker restart'"
  stop_command "su looker -c 'cd ~looker/looker && ./looker stop'"
  status_command "su looker -c 'cd ~looker/looker && ./looker status'"
  supports :restart => true, :status => true
end
