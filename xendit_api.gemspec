require File.expand_path('lib/xendit_api/version', File.dirname(__FILE__))

Gem::Specification.new do |spec|
  spec.name          = "xendit_api"
  spec.version       = XenditAPI::VERSION
  spec.license       = 'MIT'
  spec.authors       = ["Derrick Zhang"]
  spec.email         = ["robot@zillou.me"]

  spec.summary       = "Xendit API client for Ruby"
  spec.description   = "This is the API client for xendit.co"
  spec.homepage      = "https://github.com/zillou/xendit_api"

  spec.files = Dir["lib/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
