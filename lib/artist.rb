## The Artist class is responsible for either creating the
## artist (if artist doesn't yet exist) or finding the instance
## of that artist(if artist does exist)

class Artist 
    attr_accessor :name 
    @@all = []

    def initialize(name)
        @name = name 
        save 
    end 

    def self.all
        @@all 
    end 

    def save
        @@all << self
    end 

    def add_song(song)
        song.artist = self 
    end 

    def songs 
        Song.all.select {|song| song.artist == self}
    end 

    def self.find(name)
        self.all.detect {|artist| artist.name == name}
    end 

    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
    end

    def print_songs
        songs.collect {|song| puts song.name}
    end 
end 