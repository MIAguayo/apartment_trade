class CreateApartments < ActiveRecord::Migration[6.0]
  def change
    create_table :apartments do |t|
      t.integer :city_id
      t.integer :owner_id
      t.date :from_date
      t.date :to_date
      t.integer :price
      t.integer :bedrooms
      t.integer :bathrooms
      t.boolean :parking_available
      t.boolean :availability
      t.boolean :negotiable
      t.text :area
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
