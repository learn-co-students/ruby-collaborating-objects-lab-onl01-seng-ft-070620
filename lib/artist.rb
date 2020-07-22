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
  
  def add_song(song)
    song.artist = self
  end
  
  def songs
      Song.all.filter do |song|
          song.artist == self
      end
  end
 
  def self.find_or_create_by_name(name)
    artist = Artist.all.detect do |artist|
      artist.name == name
    end
    if !artist.nil?
      artist
    else
      Artist.new(name)
    end
  end
  
  def print_songs
    Song.all.each do |song|
      if song.artist == self
        puts "#{song.name}"
      end
    end
  end
  
end
