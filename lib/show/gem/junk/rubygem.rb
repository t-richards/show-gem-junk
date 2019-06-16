# frozen_string_literal: true

# RubyGem is an unpacked gem on disk
class Show::Gem::Junk::RubyGem
  attr_accessor :name, :version, :files

  def initialize(path)
    @name, _, @version = path.gsub(GEMS_DIR, '').rpartition('-')
    @files = Dir.glob("#{GEMS_DIR}#{name}-#{version}/**/*").map { |f| Show::Gem::Junk::GemFile.new(f) }
  end

  def junk_files
    files.select(&:junk?)
  end

  def size
    files.map(&:size).sum
  end

  def junk_size
    junk_files.map(&:size).sum
  end

  def percent_junk
    return 0.0 if size.zero?

    (junk_size.to_f / size) * 100
  end

  def <=>(other)
    percent_junk <=> other.percent_junk
  end

  def pretty_junk_files
    junk_files.map(&:pretty_path)
  end
end
