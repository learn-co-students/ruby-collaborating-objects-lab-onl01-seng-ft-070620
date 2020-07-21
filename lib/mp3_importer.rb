# learn spec/mp3_importer_spec.rb
require 'pry'
class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end
  
  def files
    file_dir = Dir.glob("./spec/fixtures/mp3s/*.mp3")
    file_dir.map { |file| file.gsub("./spec/fixtures/mp3s/", "")}
  end

  def import
    self.files.each { |file| Song.new_by_filename(file) }
  end
end