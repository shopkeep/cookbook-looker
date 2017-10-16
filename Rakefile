# frozen_string_literal: true

require 'rubocop/rake_task'
require 'foodcritic'
require 'rspec/core/rake_task'

RuboCop::RakeTask.new
FoodCritic::Rake::LintTask.new
RSpec::Core::RakeTask.new(:spec)

task default: %i[rubocop foodcritic spec]
