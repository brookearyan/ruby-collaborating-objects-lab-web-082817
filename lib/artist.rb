class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
    # binding.pry
  end

  def self.all
    @@all
  end

  def add_song(song)
    self.songs << song
  end

  def self.find_or_create_by_name(name)
    target = @@all.find { |artist| artist.name == name }
    if target == nil
      new_artist = Artist.new(name)
      new_artist.save
      new_artist
    else
      return target
    end
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end



end
