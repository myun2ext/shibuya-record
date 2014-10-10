# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shibuya_record/version'

Gem::Specification.new do |spec|
  spec.name          = "shibuya_record"
  spec.version       = ShibuyaRecord::VERSION
  spec.authors       = ["myun2"]
  spec.email         = ["myun2@nwhite.info"]
  spec.summary       = %q{Shibuya Record is Simple O/R Mapper on Ruby.}
  spec.description   = %q{Shibuya Record is Simple O/R Mapper on Ruby. Like Active Record and more simple and Lesser..}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
