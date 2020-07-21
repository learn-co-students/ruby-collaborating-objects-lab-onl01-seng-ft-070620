# The MP3Importer class will parse all the filenames in the spec/fixtures folder 
# and send the filenames to the Song class
require 'pry'

class MP3Importer

    attr_reader :path

    def initialize (path)
        @path = path
    end
    
    def files 
        path_var = Dir.glob("#{@path}/*.mp3")
        path_var.collect {|file| file.gsub("#{@path}/", "")}
        # REGEX to remove .mp3 --> file.gsub(/.\/spec\/fixtures\/mp3s\/|.mp3/,"")
    end


    def import 
        self.files.each do |filename|
            Song.new_by_filename(filename)
        end
    end

end
