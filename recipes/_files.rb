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

looker_s3_url = node['looker']['s3']['url']

startup_script = "#{looker_run_dir}/looker"
jar_file = "#{looker_run_dir}/looker.jar"

directory "#{looker_home}/looker" do
  owner 'looker'
  group 'looker'
end

s3_file startup_script do
  remote_path node['looker']['s3']['startup_script']
  s3_url looker_s3_url
  owner 'looker'
  group 'looker'
  mode 0750
  not_if { ::File.exists?(startup_script) }
end

s3_file jar_file do
  remote_path node['looker']['s3']['jar_file']
  s3_url looker_s3_url
  owner 'looker'
  group 'looker'
  mode 0750
  not_if { ::File.exists?(jar_file) }
end
