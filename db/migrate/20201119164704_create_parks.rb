class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.text :description
      t.string :cover
      t.string :images
      t.string :avatar
      t.string :address_line_1
      t.string :address_line_2
      t.string :post_code
      t.references :user

      t.timestamps
    end
  end
end
