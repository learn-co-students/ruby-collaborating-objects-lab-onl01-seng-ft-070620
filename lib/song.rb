require 'pry'
class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def artist_name
        artist.name if artist
    end

    def artist_name= (name)
        self.artist = Artist.find_or_create_by_name(name)
    end

    def self.new_by_filename(filename)
        new_name = filename.split(" - ")[1]
        new_song = self.new(new_name)
        new_song.artist_name = filename.split(" - ")[0]
        new_song
    end
end

# Song.new_by_filename("Michael Jackson - Black or White - pop.mp3")