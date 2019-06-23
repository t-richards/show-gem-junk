# frozen_string_literal: true

require 'pathname'

# GemFile is a file that belongs to a rubygem
class Show::Gem::Junk::GemFile
  attr_accessor :path, :stat

  def initialize(path)
    @path = path
    @stat = File.stat(path)
  end

  def size
    stat.size
  end

  def pretty_path
    path.gsub(GEMS_DIR, '')
  end

  def <=>(other)
    size <=> other.size
  end

  def junk?
    return false if File.directory?(path)

    basename = File.basename(path)

    # Files
    return true if basename.end_with?('.gemspec')
    return true if basename == '.gitignore'
    return true if basename == '.travis.yml'
    return true if basename == '.appveyor.yml'

    # Loose path matching
    return true if path.include?('concourse')

    # Specs
    parts = Pathname.new(pretty_path).each_filename.to_a
    return false if parts.size < 2
    return true if parts[1] == 'test'
    return true if parts[1] == 'spec'
    return true if parts[1] == 'features'

    false
  end
end
