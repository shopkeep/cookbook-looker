require 'serverspec'

set :backend, :exec

# Use Chef's embedded gems so ohai works
chef_gem_path = Dir.glob('/opt/chef/embedded/lib/ruby/gems/*')
chef_gem_path.each do |path|
  gemdirs = Dir.glob("#{path}/gems/*")
  gemdirs = gemdirs.map { |x| x + '/lib' }
  $LOAD_PATH.push(*gemdirs)
end

require 'ohai'

PLUGIN_PATH = '/etc/chef/ohai_plugins'
Ohai::Config[:plugin_path] << PLUGIN_PATH
o = Ohai::System.new
o.all_plugins

OHAI = o.data
