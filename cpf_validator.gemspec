# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = "cpf_validator"
  s.version     = "0.2.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Gabriel Sobrinho"]
  s.email       = ["gabriel.sobrinho@gmail.com"]
  s.homepage    = "https://github.com/nohupbrasil/cpf_validator"
  s.summary     = %q{CPF validation for ActiveModel}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activemodel', '>= 3.0'
  s.add_development_dependency 'rake', '>= 0.8.7'
end
