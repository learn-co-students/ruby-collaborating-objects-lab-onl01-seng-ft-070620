require 'artist.rb'
require 'pry'

class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    self.name = name
    @@all << self
  end #initialize

  def self.all
    @@all
  end #self.all

  def artist_name
    self.artist.name if self.artist
  end #artist

  def self.new_by_filename(file_name)
    # binding.pry
    parsed_file_name = file_name.split(' - ')
    song_name = parsed_file_name[1]
    artist_name = parsed_file_name[0]
    song = Song.new(song_name)
    artist = Artist.new(artist_name)
    song.artist = artist
    song
  end #new_by_filename

  def artist_name=(artist_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(self)
  end #artist_name=

end #Song
