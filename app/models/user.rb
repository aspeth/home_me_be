class User < ApplicationRecord
  validates_presence_of :email

  has_many :user_shelters
  has_many :shelters, through: :user_shelters
end
