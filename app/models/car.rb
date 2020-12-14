class Car < ApplicationRecord
  belongs_to :user
  has_many :car_park_slots

  validates :number_plate,:name, presence: true
end
