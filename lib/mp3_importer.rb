require 'pry'

## The MP3Importer class will parse all the filenames
## and send the filenames to the Song class

class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end 

    def files 
        Dir.entries(path).select do |song|
            song if song.size > 2
        end 
    end

    def import
        files.each {|filename| Song.new_by_filename(filename)}
    end 
end

# Dir["/path/to/search/*"]
# Dir.glob
# Dir.entries