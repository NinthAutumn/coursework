class CreateCarParkSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :car_park_slots do |t|
      t.references :park_slot, foreign_key: true
      t.references :car, foreign_key: true
      t.index [:park_slot_id, :car_id], unique: true
      t.timestamps
    end
  end
end
