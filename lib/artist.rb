class Artist
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
    name.artist = self unless name.artist == self
  end

  def genres
    self.songs.collect {|o| o.genre}.uniq
  end

end
