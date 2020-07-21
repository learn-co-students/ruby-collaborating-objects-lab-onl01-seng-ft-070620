require'pry'

class Artist

    @@all = []
    attr_accessor :name

    def initialize (name)
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

    def self.find_or_create_by_name (name)
        # binding.pry
        if self.all.detect {|artist| artist.name == name} != nil
            self.all.detect {|artist| artist.name == name}
        else 
            artist = self.new(name)
        end
    end

    def print_songs
    #    binding.pry
        self.songs.each do |song|
            puts song.name
        end
    end

end

