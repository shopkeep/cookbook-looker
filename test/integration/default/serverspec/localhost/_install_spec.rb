require_relative '../spec_helper'

describe 'looker:_install' do
  let(:looker_run_dir) { "#{LOOKER_HOME}/looker" }

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
end
