class CreateThings < ActiveRecord::Migration[5.0]
  def change
    create_table :things do |t|
      t.references :delivery, index: true
      t.references :shop, index: true
      t.string :uid
      t.string :name
      t.text :description
      t.string :image
      t.decimal :price
      t.integer :discount, default: 0, null: false

      t.timestamps
    end
  end
end
