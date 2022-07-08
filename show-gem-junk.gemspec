# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'show/gem/junk/version'

Gem::Specification.new do |spec|
  spec.name         = 'show-gem-junk'
  spec.version      = Show::Gem::Junk::VERSION
  spec.authors      = ['Tom Richards']
  spec.email        = ['tom@tomrichards.net']

  spec.summary      = 'A tool for analyzing junk contained within your GEM_HOME'
  spec.description  = 'Analyzes gems and shows a table of junk by percentage.'
  spec.homepage     = 'https://github.com/t-richards/show-gem-junk'
  spec.license      = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/t-richards/show-gem-junk'
  spec.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").grep(/exe|lib/)
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '~> 7.0'
  spec.add_dependency 'colorator', '~> 1.1'
end
