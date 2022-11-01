# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scala2sysex/version'

Gem::Specification.new do |spec|
  spec.name          = "scala2sysex"
  spec.version       = Scala2sysex::VERSION
  spec.authors       = ["William Bajzek"]
  spec.email         = ["williambajzek@gmail.com"]
  spec.description   = %q{Converts a scala file to MTS sysex}
  spec.summary       = %q{Converts a scala file to MTS sysex}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
