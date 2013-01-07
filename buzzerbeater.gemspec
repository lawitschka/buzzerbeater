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
  gem.summary       = %q{API Adapter for the world's largest basketball manager game Buzzerbeater.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
