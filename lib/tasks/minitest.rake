require 'rake/testtask'

# Rake::TestTask.new(mini: "db:test:prepare") do |t|
Rake::TestTask.new(:mini) do |t|
  t.libs << "test"
  t.pattern = "spec/**/*_test.rb"
end