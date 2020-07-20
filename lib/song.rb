class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.new_by_filename(filename)
    parsed_file = filename.split(" - ")
    song = self.new(parsed_file[1])
    song.artist_name = parsed_file[0]
    song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
end
