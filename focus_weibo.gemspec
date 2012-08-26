# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["jay_li"]
  gem.email         = ["jay_li@intfocus.com"]
  gem.description   = %q{oauth2 intface for sina and tencent }
  gem.summary       = %q{for sina and tencent }
  gem.homepage      = "https://github.com/jay16/focus_weibo"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "focus_weibo"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.1"
  
  gem.add_development_dependency "rspec", "~> 2.6"
  
  gem.add_runtime_dependency 'oauth2', "~> 0.8.0"
  gem.add_runtime_dependency 'hashie', "~> 1.2.0"
  gem.add_runtime_dependency 'json'  , "~> 1.7.3"
  gem.add_runtime_dependency 'rest-client', "~> 1.6.7"
  
end
