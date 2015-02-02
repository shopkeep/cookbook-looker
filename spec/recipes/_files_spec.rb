require_relative '../spec_helper'

LOOKER_HOME = '/home/looker'

describe 'looker::_files' do
  let(:chef_run) do 
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['looker']['home'] = LOOKER_HOME
      node.set['looker']['file_cookbook'] = 'looker_wrapper'
    end.converge(described_recipe) 
  end

  it 'Creates the directory "looker" inside the looker users homedir' do
    expect(chef_run).to create_directory("#{LOOKER_HOME}/looker").with(
      'owner' => 'looker',
      'group' => 'looker'
    )
  end

  it 'Places the looker startup script' do
    expect(chef_run).to create_template_if_missing("#{LOOKER_HOME}/looker/looker").with(
      'owner' => 'looker',
      'group' => 'looker',
      'mode' => 0750
    )
  end

  it 'Creates a symlink at /etc/init.d/looker to the looker start script' do
    expect(chef_run).to create_link('/etc/init.d/looker').with(
      'to' => "#{LOOKER_HOME}/looker/looker",
      'owner' => 'looker',
      'group' => 'looker'
    )
  end

  it 'Places looker.jar' do
    expect(chef_run).to create_template_if_missing("#{LOOKER_HOME}/looker/looker.jar").with(
      'owner' => 'looker',
      'group' => 'looker',
      'mode' => 0750
    )
  end

end
