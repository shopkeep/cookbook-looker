require_relative '../spec_helper'


describe 'looker::_install' do
  s3_url = 'https://s3.amazonaws.com/example'
  s3_startup_script = "#{s3_url}/foo/looker"
  s3_jar_file = "#{s3_url}/bar/looker-latest.jar"

  looker_run_dir = "#{LOOKER_HOME}/looker"
  looker_cfg = "#{looker_run_dir}/lookerstart.cfg"
  startup_script = "#{looker_run_dir}/looker"
  jar_file = "#{looker_run_dir}/looker.jar"

  let(:chef_run) do 
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['looker']['home'] = LOOKER_HOME
      node.set['looker']['run_dir'] = "#{LOOKER_HOME}/looker"
      node.set['looker']['startup_script'] = s3_startup_script
      node.set['looker']['jar_file'] = s3_jar_file
    end.converge(described_recipe) 
  end

  it 'Creates the directory "looker" inside the looker users homedir' do
    expect(chef_run).to create_directory(looker_run_dir).with(
      'owner' => 'looker',
      'group' => 'looker'
    )
  end

  it 'Gets startup script from s3' do
    expect(chef_run).to create_remote_file_if_missing(startup_script).with(
      source: s3_startup_script,
      owner: 'looker',
      group: 'looker',
      mode: 0750
    )
  end

  it 'Gets looker.jar from s3' do
    expect(chef_run).to create_remote_file_if_missing(jar_file).with(
      source: s3_jar_file,
      owner: 'looker',
      group: 'looker',
      mode: 0750
    )
  end

  %w( startup_script jar_file ).each do |download|
    it "does not redownload #{download} from s3 if it exists" do
      allow(File).to receive(:exists?).and_call_original
      allow(File).to receive(:exists?)
        .with(download)
        .and_return(true)
      expect(chef_run).to_not create_remote_file_if_missing(download)
    end
  end

end
