class Car < ApplicationRecord
  belongs_to :user
  has_many :car_park_slots

  validates :number_plate,:name, presence: true
  def self.execute_sql(*sql_array)     
    connection.execute(send(:sanitize_sql_array, sql_array))
   end
end
