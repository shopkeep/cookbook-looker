require_relative '../spec_helper'

describe 'looker::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe) }

  it 'Includes the looker::_user recipe' do
    expect(chef_run).to include_recipe('looker::_user')
  end

  it 'Includes the looker::_files recipe' do
    expect(chef_run).to include_recipe('looker::_files')
  end

  it 'Includes the looker::_service recipe' do
    expect(chef_run).to include_recipe('looker::_service')
  end

end
