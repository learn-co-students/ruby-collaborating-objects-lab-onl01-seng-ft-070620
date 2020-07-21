require 'song.rb'
require 'pry'

class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    self.name = name
    @@all << self
  end #initialize

  def songs
    Song.all.select {|song| song.artist == self}
  end #songs

  def add_song(song)
    song.artist = self
  end #add_song

  def add_song_by_name(song_name)
    song = Song.new(song_name)
    self.add_song(song)
  end #add_song_by_name

  def self.song_count
    Song.all.count
  end #song_count

  def self.all
    @@all
  end #self.all

  def self.find_or_create_by_name(name)
    artist = self.all.find {|artist| artist.name == name}
    if !artist
      artist = Artist.new(name)
    end#if
    artist
  end #find_or_create_by_name

  def print_songs
    self.songs.each {|song| puts song.name}
  end #print_songs

end #Artist
