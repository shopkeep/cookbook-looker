# frozen_string_literal: true

require 'spec_helper'

describe 'looker::default' do # rubocop:disable BlockLength
  looker_home = '/home/looker'
  looker_run_dir = "#{looker_home}/looker"

  describe group('looker') do
    it { should exist }
  end

  describe user('looker') do
    it { should exist }
    it { should belong_to_group 'looker' }
  end

  describe file('/home/looker') do
    it { should be_directory }
    it { should be_owned_by 'looker' }
    it { should be_grouped_into 'looker' }
  end

  describe file(looker_run_dir) do
    it { should be_directory }
    it { should be_owned_by 'looker' }
    it { should be_grouped_into 'looker' }
  end

  describe file("#{looker_run_dir}/looker") do
    it { should be_file }
    it { should be_owned_by 'looker' }
    it { should be_grouped_into 'looker' }
    it { should be_mode 750 }
  end

  describe file("#{looker_run_dir}/looker.jar") do
    it { should be_file }
    it { should be_owned_by 'looker' }
    it { should be_grouped_into 'looker' }
    it { should be_mode 750 }
  end

  describe file('/home/looker/looker/lookerstart.cfg') do
    it { should be_file }
    it { should be_owned_by 'looker' }
    it { should be_grouped_into 'looker' }
    it { should be_mode 640 }
  end

  describe command('/bin/sh -c "/home/looker/looker/looker status"') do
    its(:stdout) { should match 'Status:Looker Web Application running' }
  end

  describe service('looker'), if: host_inventory['platform_version'] == '14.04' do
    it { should be_running }
  end
end
