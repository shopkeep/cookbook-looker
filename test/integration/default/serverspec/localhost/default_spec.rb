require 'spec_helper'

describe 'looker::default' do
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

  describe service('looker') do
    it { should be_running }
  end

  it 'Generates an ohai attribute for looker/version' do
    expect(OHAI['looker']['version']).to match(/\d+\.\d+\.\d+/)
  end
end
