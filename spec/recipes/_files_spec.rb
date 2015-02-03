require_relative '../spec_helper'


describe 'looker::_files' do
  s3_url = 'https://s3.amazonaws.com/download.looker.com'
  s3_startup_script = 'aeHee2HiNeekoh3uIu6hec3W/looker'
  s3_jar_file = 'aeHee2HiNeekoh3uIu6hec3W/looker-latest.jar'

  looker_run_dir = "#{LOOKER_HOME}/looker"
  startup_script = "#{looker_run_dir}/looker"
  jar_file = "#{looker_run_dir}/looker.jar"

  let(:chef_run) do 
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['looker']['home'] = LOOKER_HOME
      node.set['looker']['s3']['url'] = s3_url
      node.set['looker']['s3']['startup_script'] = s3_startup_script
      node.set['looker']['s3']['jar_file'] = s3_jar_file
    end.converge(described_recipe) 
  end

  it 'Creates the directory "looker" inside the looker users homedir' do
    expect(chef_run).to create_directory(looker_run_dir).with(
      'owner' => 'looker',
      'group' => 'looker'
    )
  end

  it 'Gets startup script from s3' do
    expect(chef_run).to create_s3_file(startup_script).with(
      s3_url: s3_url,
      remote_path: s3_startup_script,
      owner: 'looker',
      group: 'looker',
      mode: 0750
    )
  end

  it 'Gets looker.jar from s3' do
    expect(chef_run).to create_s3_file("#{LOOKER_HOME}/looker/looker.jar").with(
      s3_url: s3_url,
      remote_path: s3_jar_file,
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
      expect(chef_run).to_not create_s3_file(download)
    end
  end

end
