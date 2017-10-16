# frozen_string_literal: true

#
# Cookbook Name:: looker
# Recipe:: ohai_plugin
#
# Copyright (C) 2015 Shopkeep
#
# All rights reserved - Do Not Redistribute
#

ohai_plugin 'looker' do
  source_file 'looker.rb'
  resource :cookbook_file
end
