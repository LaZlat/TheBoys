class Comm
  include Mongoid::Document

  belongs_to :user, class_name: "User"

  field :username, type: String
  field :comment, type: String

  validates :username, :comment, presence: true
  
end
