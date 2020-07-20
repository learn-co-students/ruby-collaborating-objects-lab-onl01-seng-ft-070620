class Artist
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
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
  
  def print_songs
    # take the result of songs -- an array of all songs by that artist -- and print out
    # just the name for each
    songs.each {|song| puts song.name}
  end
  
  def self.all
    @@all
  end
  
  def self.find_or_create_by_name(name)
    
    # if this artist -- name -- doesn't exist yet, create an artist instance for it
    if self.all.find {|artist| artist.name == name} == nil
      Artist.new(name)
    else #otherwise, find the instance
      self.all.find {|artist| artist.name == name}
    end
    
  end
  
end