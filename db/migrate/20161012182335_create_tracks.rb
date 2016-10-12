class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.references :thing, foreign_key: true
      t.references :shop, foreign_key: true
      t.decimal :price
      t.integer :discount

      t.timestamps
    end
  end
end
