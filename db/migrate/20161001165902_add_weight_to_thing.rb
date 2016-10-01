class AddWeightToThing < ActiveRecord::Migration[5.0]
  def change
    add_column :things, :weight, :float
  end
end
