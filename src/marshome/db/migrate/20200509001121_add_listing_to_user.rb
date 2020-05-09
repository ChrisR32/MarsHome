class AddListingToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :listing, :string
  end
end
