#
# Cookbook Name:: looker
# Recipe:: _user
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#

group 'looker'

user 'looker' do
  action :create
  gid 'looker'
  home node['looker']['home']
  shell '/bin/sh'
  supports :manage_home => true
end
