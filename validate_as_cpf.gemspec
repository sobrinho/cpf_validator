# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cpf_validator/version"

Gem::Specification.new do |s|
  s.name        = "validates_as_cpf"
  s.version     = CpfValidator::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Gabriel Sobrinho"]
  s.email       = ["gabriel.sobrinho@gmail.com"]
  s.homepage    = "https://github.com/sobrinho/validates_as_cpf"
  s.summary     = %q{CPF validation for ActiveModel}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency(%q<activemodel>, [">= 3.0"])
end
