class AddImageLatitudeToMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :image_latitude, :float
  end
end
