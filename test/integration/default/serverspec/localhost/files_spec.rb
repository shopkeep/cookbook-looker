require_relative '../spec_helper'

describe 'looker:_files' do
  describe file('/home/looker/looker') do
    it { should be_directory }
    it { should be_owned_by 'looker' }
    it { should be_grouped_into 'looker' }
  end

  describe file('/home/looker/looker/looker') do
    it { should be_file }
    it { should be_owned_by 'looker' }
    it { should be_grouped_into 'looker' }
    it { should be_mode 750 }
  end

  describe file('/home/looker/looker/looker.jar') do
    it { should be_file }
    it { should be_owned_by 'looker' }
    it { should be_grouped_into 'looker' }
    it { should be_mode 750 }
  end

end
