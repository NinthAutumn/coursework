class CarParkSlot < ApplicationRecord
  belongs_to :park_slot
  belongs_to :car
end
