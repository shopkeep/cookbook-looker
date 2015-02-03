require_relative '../spec_helper'

describe 'looker:_user' do
  describe user('looker') do
    it { should exist }
    it { should belong_to_group 'looker' }
  end

  describe group('looker') do
    it { should exist }
  end

  describe file('/home/looker') do
    it { should be_directory }
    it { should be_owned_by 'looker' }
    it { should be_grouped_into 'looker' }
  end
end
