# frozen_string_literal: true

# Character class
class Character
  # include Mongoid::Document
  attr_reader :image, :name, :description

  def initialize(image, name, description)
    @image = image
    @name = name
    @description = description
  end
end
