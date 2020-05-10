class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.date :listing_date
      t.integer :bed_room
      t.integer :bath_room
      t.integer :parking_space
      t.integer :living_area
      t.boolean :air_conditioning
      t.boolean :heating
      t.boolean :yard
      t.boolean :smart_system
      t.float :price
      t.integer :address_number
      t.string :address_street
      t.string :address_zone
      t.string :address_city
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
