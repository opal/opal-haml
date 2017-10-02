require 'bundler'
Bundler.require
Bundler::GemHelper.install_tasks

require 'opal/rspec/rake_task'
Opal::RSpec::RakeTask.new(:default) do |server, task|
  task.pattern = 'spec-opal/**/*_spec.rb'
  task.default_path = 'spec-opal'
end
