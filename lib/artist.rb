require 'pry'
class Artist
  attr_accessor :name

  @@all = []  # collect all instances of Artist so we can check if artist exitsts or not
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all  #=> array of all aritst objects
    @@all
  end

  def songs
    # binding.pry
    Song.all.select do |song|
      song.artist == self
    end
  end
  
  def add_song(song_name) # links song to artist
    song_name.artist = self
  end
  
  def self.find_or_create_by_name(artist_name)  # take name as String
    artist = @@all.find {|artist| artist.name == artist_name} #=> nil or instance of artist
    artist == nil ? artist = self.new(artist_name) : artist #=> artist instance, creates new if needed
  end
  
  def print_songs 
    Song.all.select {|song| puts song.name if song.artist == self} # prints all artist's songs
  end
end


