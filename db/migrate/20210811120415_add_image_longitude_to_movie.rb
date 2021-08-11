class AddImageLongitudeToMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :image_longitude, :float
  end
end
