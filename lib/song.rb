
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
  
 def self.new_by_filename(file)
   file_split = file.split(" - ")
   new_song = self.new(file_split[1])
   new_song.artist_name = file_split[0]
   new_song
 end
  
  def artist_name=(name)
   self.artist = Artist.find_or_create_by_name(name)
 end
  
end

# describe '#artist=' do
#     it 'sets the artist object to belong to the song' do
#       song = Song.new('Man in the Mirror')
#       new_artist_object = Artist.new('King of Pop')
#       song.artist = new_artist_object
#       expect(song.artist).to eq(new_artist_object)
#     end
#   end