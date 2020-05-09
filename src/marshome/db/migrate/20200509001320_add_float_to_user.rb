class AddFloatToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rating_total, :float
  end
end
