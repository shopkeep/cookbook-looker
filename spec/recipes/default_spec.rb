require_relative '../spec_helper'

describe 'looker::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe) }

end
