class Park < ApplicationRecord
  belongs_to :user
  has_many :park_slots
  def self.execute_sql(*sql_array)     
    connection.execute(send(:sanitize_sql_array, sql_array))
   end
end
