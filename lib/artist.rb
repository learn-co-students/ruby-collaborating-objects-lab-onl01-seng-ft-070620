## The Artist class is responsible for either creating the
## artist (if artist doesn't yet exist) or finding the instance
## of that artist(if artist does exist)

class Artist 

    attr_accessor :name 
    @@all = []

    def initialize(name)
        @name = name 
        @@all << self
    end 

    def self.all
        @@all 
    end 

    def add_song(song)
        song.artist = self 
    end 

    def songs 
        Song.all.select {|song| song.artist == self}
    end 

    def self.find_or_create_by_name(artist_name)
        artist = self.all.detect {|artist|artist.name == artist_name}
        if artist
            artist 
        else
            artist = self.new(artist_name) 
            artist
        end
    end

    def print_songs
        songs.collect {|song| puts song.name}
    end 
end 