

class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def songs
    Song.all.select{|song| song.artist == self}
  end

  def add_song(song)
    song.artist = self
  end

  def add_song_by_name(name)
    song = Song.new(name)
    self.add_song(song)
  end

  def self.song_count
    Song.all.count
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    @@all.each{|artist| return artist if artist.name == name}
    Artist.new(name)
  end

  def print_songs
    self.songs.each{|song| puts song.name}
  end

end
