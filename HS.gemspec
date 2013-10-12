# -*- encoding: utf-8 -*-
HS_VERSION = "0.1"

Gem::Specification.new do |spec|
  spec.name          = "hs"
  spec.version       = HS_VERSION
  spec.authors       = ["Holger Sindbaek"]
  spec.email         = ["HolgerSindbaek@gmail.com"]
  spec.description   = %q{Generic helpers I tend to use in a lot of different apps}
  spec.summary       = %q{Generic helpers I tend to use in a lot of different apps}
  spec.homepage      = "https://github.com/holgersindbaek/HS"
  spec.license       = "MIT"
  
  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
  spec.add_dependency "sugarcube"
  spec.add_dependency "bubble-wrap", "~> 1.3.0"
end