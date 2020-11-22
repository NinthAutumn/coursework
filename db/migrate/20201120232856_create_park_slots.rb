class CreateParkSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :park_slots do |t|
      t.references :park, foreign_key: true
      t.float :height
      t.float :width
      t.float :price

      t.timestamps
    end
  end
end
