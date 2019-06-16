# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'show/gem/junk/version'

Gem::Specification.new do |spec|
  spec.name          = 'show-gem-junk'
  spec.version       = Show::Gem::Junk::VERSION
  spec.authors       = ['Tom Richards']
  spec.email         = ['tom@tomrichards.net']

  spec.summary       = 'A tool for analyzing junk contained within your GEM_HOME'
  spec.description   = 'Analyzes gems and displays a table of junk by percentage.'
  spec.homepage      = 'https://github.com/t-richards/show-gem-junk'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/t-richards/show-gem-junk'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").grep(/exe|lib/)
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '~> 5.2.3'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop'
end
