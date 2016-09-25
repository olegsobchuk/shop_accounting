class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.string :uid
      t.date :departure
      t.date :arrival

      t.timestamps
    end
  end
end
