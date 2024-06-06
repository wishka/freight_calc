# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'yard'

RSpec::Core::RakeTask.new

YARD::Rake::YardocTask.new

begin
  require "rubocop/rake_task"
  RuboCop::RakeTask.new

  RuboCop::RakeTask.new("rubocop:md") do |task|
    task.options << %w[-c .rubocop-md.yml]
  end
rescue LoadError
  task(:rubocop) {}
  task("rubocop:md") {}
end

task default: %i[spec rubocop]
