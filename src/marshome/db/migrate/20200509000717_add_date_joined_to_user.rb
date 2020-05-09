class AddDateJoinedToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :date_joined, :datetime
  end
end
