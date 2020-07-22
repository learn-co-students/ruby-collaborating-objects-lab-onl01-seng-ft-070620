class Song
	attr_accessor :name, :artist
    
    @@all = []
    
    def initialize(name)
    	@name = name
      @@all << self
    end 
    
    def artist_name=(artist_name)
      artist = Artist.find_or_create_by_name(artist_name)
      artist.add_song(self)
    end
    
    def self.new_by_filename(filename)
      tunes = filename.split(" - ")
      song = Song.new(tunes[1])
      song.artist_name = tunes[0]
      song
    end
    
    def self.all
    	@@all
    end
end