# frozen_string_literal: true

class User
  include Mongoid::Document
  has_many :comms, dependent: :destroy

  field :username, type: String
  field :password, type: String

  validates :password, presence: true
end
