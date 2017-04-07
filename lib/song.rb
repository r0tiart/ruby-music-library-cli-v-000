class Song
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  extend Concerns::Creatable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  attr_accessor :name, :artist, :songs, :genre

  @@all = []

  def initialize (name, artist = nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre

    self.artist=artist unless artist == nil
    self.genre=genre unless genre == nil


  end

  def self.all
    @@all
  end

  def artist=(name)
    name.add_song(self) unless name.songs.include?(self)
    @artist = name
  end

  def genre=(name)
    name.add_song(self) unless name.songs.include?(self)
    @genre = name
  end

  def self.new_from_filename(file)
    elements = file.split(" - ")
    new_song = Song.new(elements[1])
    new_song.artist = Artist.new(elements[0])
    new_song.genre = Genre.new(elements[2].split(".mp3")[0])
    new_song
  end

end
