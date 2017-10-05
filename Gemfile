source 'https://rubygems.org'
gemspec
gem 'haml', ENV['HAML_VERSION'] || '> 0'

if ENV['OPAL_VERSION'] == 'master'
  gem 'opal', github: 'opal', branch: :master
  gem 'opal-rspec', github: 'opal/opal-rspec', branch: 'elia/opal-master', submodules: true
  gem 'opal-sprockets', github: 'opal/opal-sprockets'
else
  gem 'opal', '~> 0.10.5'
end
