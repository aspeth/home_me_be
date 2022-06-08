class Shelter < ApplicationRecord
  validates_presence_of :name

  has_many :user_shelters
  has_many :users, through: :user_shelters
end
