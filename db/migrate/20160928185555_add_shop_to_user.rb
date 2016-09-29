class AddShopToUser < ActiveRecord::Migration[5.0]
  def up
    add_reference :users, :shop, foreign_key: true
    remove_column :users, :placing
  end

  def down
    remove_reference :users, :shop, foreign_key: true
    add_column :users, :placing, :string
  end
end
