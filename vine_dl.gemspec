# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vine_dl/version'

Gem::Specification.new do |spec|
  spec.name          = "vine_dl"
  spec.version       = VineDl::VERSION
  spec.authors       = ["dannyvassallo"]
  spec.email         = ["danielvassallo87@gmail.com"]

  spec.summary       = %q{A Vine video ripper written in Ruby}
  spec.description   = %q{Auth a user in to vine and download the available videos to your computer or server.}
  spec.homepage      = "https://github.com/dannyvassallo/vine_dl.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
