source 'https://rubygems.org'
gemspec
gem 'haml', ENV['HAML_VERSION'] || '> 0'

if ENV['OPAL_VERSION'] == 'master'
  gem 'opal', github: 'opal', branch: :master
  gem 'opal-sprockets', github: 'opal/opal-sprockets'
  gem 'opal-rspec', github: 'opal/opal-rspec', branch: 'master', submodules: true
elsif ENV['OPAL_VERSION'].to_f >= 0.11
  gem 'opal-rspec', github: 'opal/opal-rspec', branch: 'master', submodules: true
else
  gem 'opal', '~> 0.10.5'
end
