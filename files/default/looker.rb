# frozen_string_literal: true

Ohai.plugin(:Looker) do
  provides 'looker', 'looker/version'

  collect_data do
    looker Mash.new
    so = shell_out('su looker -c "~looker/looker/looker version"')
    looker['version'] = so.stdout.chomp if so.exitstatus.zero?
  end
end
