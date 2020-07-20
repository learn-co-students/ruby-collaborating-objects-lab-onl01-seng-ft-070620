## The Song class will be responsible for creating songs given
## each filename and sending the artist's name (a string)
## to the Artist class

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

    def self.new_by_filename(filename)
        data = filename.split(" - ")
        song = self.new(data[1])
        song.artist_name = data[0]
        song 
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        # artist.add_song(self)
    end 
end 