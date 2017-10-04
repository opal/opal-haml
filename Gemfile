source 'https://rubygems.org'
gemspec
gem 'haml', ENV['HAML_VERSION'] || '> 0'

if ENV['OPAL_VERSION'] == 'master'
  gem 'opal', github: 'opal'
  gem 'opal-rspec', github: 'opal/opal-rspec'
  gem 'opal-sprockets', github: 'opal/open-sprockets'
else
  gem 'opal', '~> 0.10.5'
end
