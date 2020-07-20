

class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def artist_name
    return nil if @artist == nil
    return @artist.name
  end

  def artist_name=(name)
    @artist = Artist.find_or_create_by_name(name)
  end

  def self.new_by_filename(filename)
    split_data = filename.split(" - ")
    new_song = Song.new(split_data[1])
    new_song.artist_name = split_data[0]
    new_song
  end



end
