# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'buzzerbeater/version'

Gem::Specification.new do |gem|
  gem.name          = "buzzerbeater"
  gem.version       = Buzzerbeater::VERSION
  gem.authors       = ["Moritz Lawitschka"]
  gem.email         = ["moritz@urbanvention.com"]
  gem.description   = %q{Ruby Gem for the Buzzerbeater API.}
  gem.summary       = %q{API adapter for the world's largest basketball manager game Buzzerbeater.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec',       '~> 2.12.0'
  gem.add_development_dependency 'guard',       '~> 1.6.1'
  gem.add_development_dependency 'guard-rspec', '~> 2.3.3'
  gem.add_development_dependency 'rb-fsevent',  '~> 0.9.3'
  gem.add_development_dependency 'fakeweb',     '~> 1.3.0'

  gem.add_runtime_dependency 'activesupport', '~> 3.2.11'
  gem.add_runtime_dependency 'httparty',      '~> 0.9.0'
end
