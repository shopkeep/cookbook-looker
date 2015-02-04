require_relative '../spec_helper'

describe 'looker:_install' do

  looker_run_dir = '/home/looker/looker'

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
