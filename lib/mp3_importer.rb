class MP3Importer
    attr_accessor :path

    def initialize(file_path)
        @path = file_path
    end

    def files
        Dir.children("spec/fixtures/mp3s/")
    end

    def import
      files.each {|file| Song.new_by_filename(file)}     
    end

end