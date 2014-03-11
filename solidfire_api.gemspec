# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'solidfire_api/version'

Gem::Specification.new do |spec|
  spec.name          = "solidfire_api"
  spec.version       = SolidfireApi::VERSION
  spec.authors       = ["Pierre-Luc Dion"]
  spec.email         = ["pdion@cloudops.com"]
  spec.summary       = %q{Solidfire Storage API Ruby Libraries}
  spec.description   = %q{Ruby client for Solidfire Storage API. Usefull for metric collection of Volumes and cluster status}
  spec.homepage      = "https://github.com/pdion891/solidfire_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  
  # Other Gems dependencies
  spec.add_runtime_dependency "rest-client"
end
