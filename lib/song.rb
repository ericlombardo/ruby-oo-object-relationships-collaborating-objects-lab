require 'pry'

class Song
  attr_accessor :name, :artist

  @@all = []  # stores all the songs along with artist objects that are linked together
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename) # takes in filename
    song = filename.split(' - ')[1] # splits it into song name
    artist = filename.split(' - ')[0] # and artist name
    # binding.pry
    new_song = Song.new(song) # creates new instance of song
    # links instance of artist to song even if there isn't one yet
    new_song.artist = Artist.find_or_create_by_name(artist) 
    new_song  # returns new song instance with everything linked
  end

  def artist_name=(artist_name) # let's song assign itself to artist
    new_artist = Artist.find_or_create_by_name(artist_name) #=> artist instance, makes new if needed
    self.artist = new_artist  # link song to artist
  end
end