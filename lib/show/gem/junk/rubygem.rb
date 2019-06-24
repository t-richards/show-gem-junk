# frozen_string_literal: true

# RubyGem is an unpacked gem on disk
class Show::Gem::Junk::RubyGem
  attr_accessor :name, :path, :version, :files

  def initialize(path)
    @path = File.expand_path(path)
    @name, _, @version = path.gsub(GEMS_DIR, '').rpartition('-')
    @files = Dir.glob("#{GEMS_DIR}#{name}-#{version}/**/*", File::FNM_DOTMATCH).map do |f|
      Show::Gem::Junk::GemFile.new(f)
    end
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
end
