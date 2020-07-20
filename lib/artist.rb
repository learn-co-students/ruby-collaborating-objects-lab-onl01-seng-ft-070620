require 'pry'
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

    def self.all_names
        @@all.collect {|artist| artist.name}
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def add_song_by_name(name)
        song = Song.new(name)
        add_song(song)
    end

    def self.song_count
        Song.all.count
    end

    def self.find_or_create_by_name(name)
        if Artist.all_names.include?(name)
            Artist.all.find{|artist| artist.name = name}
        else
            Artist.new(name)
        end
    end

    def print_songs
        Song.all.each {|song| puts song.name if song.artist == self}
    end
end