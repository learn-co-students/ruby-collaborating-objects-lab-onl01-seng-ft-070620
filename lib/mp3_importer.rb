require "pry"

require_relative "artist.rb"
require_relative "song.rb"

class MP3Importer

    attr_accessor :path

    @files_arr = []

    def initialize(path) #initialize with path 
        @path = path
        self.files
    end

    def import
        #  binding.pry
         @files_arr.each do |file|
            # artist = Artist.new(artist_name)
            # binding.pry
            song = Song.new_by_filename(file)
        end
    end

    def files
        @files_arr = Dir[@path + "/*.mp3"].map do |path|
            File.basename(path, "*.mp3")
        end
        # binding.pry
        @files_arr
    end
end