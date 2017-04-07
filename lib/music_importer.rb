class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path=path
  end

  def files
    @files = Dir.entries(@path)
    mp3_files = @files.select{|item| item.include?(".mp3")}.sort
    mp3_files
  end

  def import
    self.files.each do |o|
      Song.new_from_file_name(o)
    end
    
  end
end
