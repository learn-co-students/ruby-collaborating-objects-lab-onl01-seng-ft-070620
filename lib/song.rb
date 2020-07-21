class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        self.name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_name = filename.split(" - ")[1]
        artist_name = filename.split(" - ")[0]
        song = Song.new(song_name)
        artist = Artist.new(artist_name)
        song.artist = artist
        song
    end

    def artist_name=(artist)
        artist = Artist.find_or_create_by_name(artist)
        artist.add_song(self)
    end
end