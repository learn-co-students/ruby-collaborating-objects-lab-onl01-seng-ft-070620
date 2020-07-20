class MP3Importer 
    #parse directory of files and send file names to song class
    attr_accessor :path 
    
    def initialize(path)
      @path = path
    end 
    
    def files 
      Dir.children("spec/fixtures/mp3s/")
    end
    
    def import
      files.each{ |filename| Song.new_by_filename(filename) }
    end
  end 