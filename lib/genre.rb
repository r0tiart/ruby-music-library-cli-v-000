class Genre
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  extend Concerns::Creatable::ClassMethods

  attr_accessor :name, :songs

  @@all = []

  def initialize (name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(name)
    self.songs << name unless self.songs.include?(name)
    name.genre = self unless name.genre == self
  end

  def artists
    self.songs.collect {|o| o.artist}.uniq
  end

end
