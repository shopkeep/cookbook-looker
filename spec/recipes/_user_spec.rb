require_relative '../spec_helper'

LOOKER_HOME = '/home/looker'

describe 'looker::_user' do
  let(:chef_run) do 
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['looker']['home'] = LOOKER_HOME
    end.converge(described_recipe) 
  end

  it 'Creates the looker user' do
    expect(chef_run).to create_user('looker').with(
      'supports' => { :manage_home => true },
      'home' => LOOKER_HOME,
      'shell' => '/bin/sh',
      'gid' => 'looker'
    )
  end

  it 'Creates the looger group' do
    expect(chef_run).to create_group('looker')
  end

end
