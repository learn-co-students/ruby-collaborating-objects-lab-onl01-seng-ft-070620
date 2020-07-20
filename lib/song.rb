class Song
  attr_accessor :artist, :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def save
    @@all << self
  end
  
  def artist_name=(name)
    new_artist = Artist.find_or_create_by_name(name)
    self.artist = new_artist
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(file)
    clean = file.split(" - ")
    song = Song.new(clean[1])
    song.artist_name = clean[0]
    song
  end
  
end