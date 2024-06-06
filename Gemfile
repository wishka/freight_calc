# frozen_string_literal: true

source "https://rubygems.org"

gem "debug", platform: :mri

# Specify your gem's dependencies in freight_calc.gemspec
gemspec

gem "rake", "~> 13.0"

gem "rspec", "~> 3.0"

eval_gemfile "gemfiles/rubocop.gemfile"

local_gemfile = "#{File.dirname(__FILE__)}/Gemfile.local"

if File.exist?(local_gemfile)
  eval(File.read(local_gemfile)) # rubocop:disable Security/Eval
end
