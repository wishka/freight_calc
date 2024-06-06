# frozen_string_literal: true

require_relative "lib/freight_calc/version"

Gem::Specification.new do |spec|
  spec.name = "freight_calc"
  spec.version = FreightCalc::VERSION
  spec.authors = ["Andrew Kancev"]
  spec.email = ["andrew.kancev@jetruby.com"]

  spec.summary = "Write a short summary, because RubyGems requires one."
  spec.description = "Write a longer description or delete this line."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/wishka/freight_calc/issues",
    "changelog_uri" => "https://github.com/wishka/freight_calc/blob/master/CHANGELOG.md",
    "documentation_uri" => "https://github.com/wishka/freight_calc",
    "homepage_uri" => "https://github.com/wishka/freight_calc",
    "source_code_uri" => "https://github.com/wishka/freight_calc"
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency 'factory_bot_rails'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
