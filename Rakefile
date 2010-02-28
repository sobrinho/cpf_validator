require 'rake/testtask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the validates_as_cpf plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "validates_as_cpf"
    gemspec.summary = "CPF validation for ActiveModel"
    gemspec.email = "gabriel.sobrinho@gmail.com"
    gemspec.homepage = "http://github.com/sobrinho/validates_as_cpf"
    gemspec.authors = ["Gabriel Sobrinho"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end
