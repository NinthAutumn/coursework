class ParkSlot < ApplicationRecord
  belongs_to :park
  has_one :car_park_slot
  def self.execute_sql(*sql_array)     
    connection.execute(send(:sanitize_sql_array, sql_array))
   end
end
