require_relative '../spec_helper'

describe 'looker::_java' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe) }

  it 'installs oracle java 7' do
    expect(chef_run).to include_recipe('java')
  end


end
