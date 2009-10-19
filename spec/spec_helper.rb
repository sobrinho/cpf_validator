require 'rubygems'

begin
  require 'spec'
rescue LoadError
  puts 'You need the rspec gem'
  exit
end

require 'validates_as_cpf/cpf.rb'

