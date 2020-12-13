class Park < ApplicationRecord
  belongs_to :user
  has_many :park_slots, :dependent => :delete_all
  validates :name,:description,:cover,:avatar,:address_line_1,:post_code, presence: true
  def self.execute_sql(*sql_array)     
    connection.execute(send(:sanitize_sql_array, sql_array))
   end
end
