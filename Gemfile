source 'https://rubygems.org'
gemspec

github = -> repo { "https://github.com/#{repo}" }
version = -> rs { -> vs { Gem::Requirement.new(rs) === Gem::Version.new(vs) } }
haml_version = ENV['HAML_VERSION'] || 0

gem 'haml', "~> #{haml_version}"

case ENV['OPAL_VERSION']

when 'master'
  gem 'opal', git: github['opal/opal'], branch: :master
  gem 'opal-sprockets', git: github['opal/opal-sprockets']
  gem 'opal-rspec', git: github['opal/opal-rspec'], branch: 'master', submodules: true

when version['~> 1.0.0']
  gem 'opal-rspec', '~> 0.8.0.alpha1'

when version['~> 0.10.0']
  gem 'opal', '~> 0.10.5'

end
