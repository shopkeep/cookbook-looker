require_relative '../spec_helper'

describe 'looker::_service' do

  let(:chef_run) do 
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['looker']['startup_args'] = '--ssl-keystore=/foo/bar.jks'
    end.converge(described_recipe)
  end

  looker_run_dir = "#{LOOKER_HOME}/looker"
  looker_cfg = "#{looker_run_dir}/lookerstart.cfg"

  it 'Creates lookerstart.cfg with the correct content' do
    expect(chef_run).to render_file(looker_cfg).with_content(
      /LOOKERARGS=\"--ssl-keystore=\/foo\/bar\.jks\"/
    )
  end

  it 'Creates the looker service' do
    expect(chef_run).to start_service('looker')
  end
      
  it 'Restarts looker when lookerstart.cfg is modified' do
    looker = chef_run.service('looker') 
    expect(looker).to subscribe_to(
      "template[#{LOOKER_HOME}/looker/lookerstart.cfg]"
    )
  end

end
