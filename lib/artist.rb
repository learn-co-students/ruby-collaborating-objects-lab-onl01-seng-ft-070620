class Artist 
    attr_accessor :name 
    
    @@all = []
    
    def initialize(name)
      @name = name
      save
    end 
    
    def save
      @@all << self
    end
   
    def self.all
      @@all
    end
    
    def add_song(song)
      song.artist = self
    end 
    
    def songs 
      Song.all.select {|song| song.artist == self}
    end 
    
    def self.find_by_name(name)
      self.all.find {|artist_name| artist_name.name == name}
    end 
    
    def self.find_or_create_by_name(name)
      if find_by_name(name)
        find_by_name(name)
      else name = self.new(name)
      end 
    end 
    
    def print_songs
      Song.all.select {|song| puts song.name if song.artist == self}
    end 
    
  end 