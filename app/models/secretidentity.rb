# frozen_string_literal: true

class Secretidentity
  include Mongoid::Document
  field :name, type: String
end
