class Comm
  include Mongoid::Document

  field :username, type: String
  field :comment, type: String

  validates :comment, presence: true
  
end
