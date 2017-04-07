module Concerns::Creatable

  module InstanceMethods
  end


  module ClassMethods
    def create(name)
      self.new(name).tap do |o|
        o.name = name
        o.save
      end unless self.name == name
    end
  end

end
