class Song
  attr_accessor :name, :artist
  @@all =[]
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.new_by_filename(file)
    song = file.split(" - ")[1]
    artist = file.split(" - ")[0]
    song_from_file = self.new(song)
    song_from_file.artist_name = artist
    song_from_file
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
  
  def self.all()
    @@all
  end
end