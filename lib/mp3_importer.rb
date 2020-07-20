require 'artist.rb'
require 'song.rb'
require 'pry'

class MP3Importer

  attr_accessor :path

  def initialize(file_path)
    @path = file_path
  end #initialize

  def files
    files = Dir[self.path+'/*.mp3'].collect do |file|
      file.slice!(self.path+'/')
      file
    end #do
    # binding.pry
  end #files

  def import
    files.each {|file| Song.new_by_filename(file)}
  end #import

end #MP3Importer
