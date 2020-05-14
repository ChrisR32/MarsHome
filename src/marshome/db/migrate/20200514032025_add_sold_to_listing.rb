class AddSoldToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :sold, :boolean
  end
end
