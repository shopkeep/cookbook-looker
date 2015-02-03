require_relative '../spec_helper'

describe 'looker:_service' do

  describe file('/home/looker/looker/lookerstart.cfg') do
    it { should be_file }
    it { should be_owned_by 'looker' }
    it { should be_grouped_into 'looker' }
    it { should be_mode 640 }
    its(:content) { should match /LOOKERARGS=\"--ssl-keystore=\/home\/looker\/looker\/\.ssl\/looker\.self\.signed\.jks --ssl-keystore-pass=''\"/ }
  end

  describe service('looker') do
    it { should be_running }
  end

end
