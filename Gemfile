source 'https://rubygems.org'
gemspec
gem 'haml', ENV['HAML_VERSION'] || '> 0'

if ENV['OPAL'] == 'master'
  gem 'opal', ENV['OPAL_VERSION'] if ENV['OPAL_VERSION']
  gem 'opal-rspec', path: '../opal-rspec'
  gem 'opal', path: '../opal'
  gem 'opal-sprockets', '0.4.1.0.11.0.rc1.3.1.beta2'
else
  gem 'opal', '~> 0.10.5'
end
