require_relative "song.rb"

class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self      #pushing self 
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        artist = @@all.find do |artist|
            artist.name = name
        end
        if artist.nil?
            artist = Artist.new(name)
        end
        artist
    end

    def print_songs
        Song.all.each do |song|
            if (song.artist == self)
                puts song.name
            end
        end
    end
end