class Artist
    attr_accessor :name
    
    @@all = []

    def initialize(name)
        self.name = name
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

    def self.find_or_create_by_name(name)
        artist = Artist.all.find{|artist| artist.name == name} 
            if !artist
                artist = Artist.new(name)
            end
        artist
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end

end