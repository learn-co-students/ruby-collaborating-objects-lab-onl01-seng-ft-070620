class Song 
    attr_accessor :name, :artist 
    
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
    
   def self.new_by_filename(filename)
      formatted_filename = filename.split(" - ")
      song = self.new(formatted_filename[1])
      song.artist_name = (formatted_filename[0])
      song
    end
    
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
    
  end 