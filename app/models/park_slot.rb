class ParkSlot < ApplicationRecord
  belongs_to :park
  has_one :car_park_slot, :dependent => :destroy
  validates :height,:price,:width,:park, presence: true
  def self.execute_sql(*sql_array)     
    connection.execute(send(:sanitize_sql_array, sql_array))
   end
end
