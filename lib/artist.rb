class Artist
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  def self.all()
    @@all
  end
  
  def add_song(song)
    song.artist = self
    @songs << song
  end
  
  def songs()
    @songs
  end
  
  def self.find_or_create_by_name(name)
    found_artist = self.all.detect do |artist|
      artist.name == name
    end
    if found_artist
      found_artist
    else
      new_artist = self.new(name)
      # @@all << self
      new_artist
    end
  end
  
  def print_songs()
    @songs.each do |song|
      puts "#{song.name}"
    end
  end
  
end