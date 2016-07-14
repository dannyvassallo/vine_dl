require "bundler/gem_tasks"

desc "Run tests"
task :test do
  Dir["#{__dir__}/spec/**/*_spec.rb"].each(&method(:load))
end

task :default => :test
