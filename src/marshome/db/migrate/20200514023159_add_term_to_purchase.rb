class AddTermToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :term, :boolean
  end
end
