# frozen_string_literal: true

# GemFile is a file that belongs to a rubygem
class Show::Gem::Junk::GemFile
  attr_accessor :path, :info

  def initialize(path)
    @path = path
    @info = File.info(path)
  end

  def size
    info.size
  end

  def pretty_path
    path.gsub(GEMS_DIR, '')
  end

  def junk?
    return false if File.directory?(path)

    basename = File.basename(path)

    # Files
    return true if basename.ends_with?('.gemspec')
    return true if basename == '.gitignore'
    return true if basename == '.travis.yml'
    return true if basename == '.appveyor.yml'

    # Loose path matching
    return true if path.includes?('concourse')

    # Test and spec should be at top level
    trimmed_path = path.lchop(GEMS_DIR)
    parts = Path.new(trimmed_path).parts
    return false if parts.size < 2
    return true if parts[1] == '/spec'
    return true if parts[1] == '/test'

    false
  end
end
