require_relative '../spec_helper'

describe 'looker:_service' do

  describe service('looker') do
    it { should be_running }
  end

end
