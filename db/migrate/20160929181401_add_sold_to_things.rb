class AddSoldToThings < ActiveRecord::Migration[5.0]
  def change
    add_column :things, :sold, :boolean, defailt: false
    add_column :things, :sold_date, :datetime
    add_index :things, :sold
    add_index :things, :sold_date
  end
end
