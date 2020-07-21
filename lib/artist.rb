# learn spec/artist_spec.rb
require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end
  
  def self.all
    @@all
  end

  def add_song(song)
    self.songs << song
  end

  def self.find_or_create_by_name(name)
      if self.all.find { |artist| artist.name == name } == nil
        artist = self.new(name)
      else
        self.all.find { |artist| artist.name == name }
      end
  end
  
  def print_songs
    songs.map { |song| puts song.name }
  end
end