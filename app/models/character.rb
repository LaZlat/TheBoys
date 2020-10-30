class Character

    attr_reader :image, :name, :description

    def initialize(image, name, description)
        @image = image
        @name = name
        @description = description
    end
end
