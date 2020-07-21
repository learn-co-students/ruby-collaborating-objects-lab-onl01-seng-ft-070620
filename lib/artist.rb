
class Artist
  
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
 
  def save
    @@all << self
  end
 
  def self.all
    @@all
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def self.find_by_name(name)
    self.all.find {|artist| artist.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      name = self.new(name)
    else
      find_by_name(name)
    end
  end
  
  def print_songs
    Song.all.select do |song|
      if song.artist == self
        puts song.name
      end
    end
  end
  
end


