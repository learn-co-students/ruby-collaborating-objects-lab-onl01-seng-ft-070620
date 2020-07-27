class MP3Importer
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files()
    files = []
    Dir.new(self.path).each do |music_file|
      if music_file.length > 4
        files << music_file
      end
    end
    files
  end
  
  def import()
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
end