# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carter_dte_smtp/version'

Gem::Specification.new do |spec|
  spec.name          = "carter_dte_smtp"
  spec.version       = CarterDteSmtp::VERSION
  spec.authors       = ["Patricio Bruna"]
  spec.email         = ["pbruna@zboxapp.com"]
  spec.summary       = "Postfix SMTP Filter to parse DTE files"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/ZBoxApp/devise_zimbra_authenticatable"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'celluloid-io'
  spec.add_dependency 'mail'
  spec.add_dependency 'thor'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest-reporters"
end
