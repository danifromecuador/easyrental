class User < ApplicationRecord
  has_many :reservations
  has_many :cars

  validates :name, presence: true, uniqueness: true
end
