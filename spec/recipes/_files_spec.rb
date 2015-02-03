require_relative '../spec_helper'


describe 'looker::_files' do
  s3_url = 'https://s3.amazonaws.com/download.looker.com'
  s3_startup_file = 'aeHee2HiNeekoh3uIu6hec3W/looker'
  s3_jar_file = 'aeHee2HiNeekoh3uIu6hec3W/looker-latest.jar'

  let(:chef_run) do 
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['looker']['home'] = LOOKER_HOME
      node.set['looker']['s3']['url'] = s3_url
      node.set['looker']['s3']['startup_file'] = s3_startup_file
      node.set['looker']['s3']['jar_file'] = s3_jar_file
    end.converge(described_recipe) 
  end

  it 'Creates the directory "looker" inside the looker users homedir' do
    expect(chef_run).to create_directory("#{LOOKER_HOME}/looker").with(
      'owner' => 'looker',
      'group' => 'looker'
    )
  end

  it 'Gets startup script from s3' do
    expect(chef_run).to create_s3_file("#{LOOKER_HOME}/looker/looker").with(
      s3_url: s3_url,
      remote_path: s3_startup_file,
      owner: 'looker',
      group: 'looker',
      mode: 0750
    )
  end

  context 'if startup script is already downloaded' do
    before { allow(File).to receive(:exist?).with("#{LOOKER_HOME}/looker/looker") }
    it 'does not get startup script from s3' do
      expect(chef_run).to_not create_s3_file("#{LOOKER_HOME}/looker/looker")
    end
  end

  it 'Gets looker.jar from s3' do
    expect(chef_run).to create_s3_file("#{LOOKER_HOME}/looker/looker").with(
      s3_url: s3_url,
      remote_path: s3_startup_file,
      owner: 'looker',
      group: 'looker',
      mode: 0750
    )
  end

  context 'if looker.jar already exists' do
    before { allow(File).to receive(:exist?).with("#{LOOKER_HOME}/looker/looker.jar") }
    it 'does not get looket.jar from s3' do
      expect(chef_run).to_not create_s3_file("#{LOOKER_HOME}/looker/looker.jar")
    end
  end


end
