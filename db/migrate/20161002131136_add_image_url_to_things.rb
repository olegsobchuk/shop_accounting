class AddImageUrlToThings < ActiveRecord::Migration[5.0]
  def change
    add_column :things, :image_url, :string
    add_column :things, :image_thumb, :string
    add_column :things, :image_id, :string
  end
end
