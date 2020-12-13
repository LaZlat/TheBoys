class User
    include Mongoid::Document
  
    field :username, type: String
    field :password, type: String

    validates :password, presence: true
    
  end
  