#
# Cookbook Name:: looker
# Recipe:: default
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'looker::_user'
include_recipe 'looker::_files'
include_recipe 'looker::_java'
include_recipe 'looker::_service'
