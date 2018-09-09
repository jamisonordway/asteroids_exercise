class NearEarthObject
  attr_reader :name, :object_id

    def initialize(name, object_id)
      @name = name
      @object_id = object_id
    end
end