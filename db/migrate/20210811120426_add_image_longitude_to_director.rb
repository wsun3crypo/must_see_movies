class AddImageLongitudeToDirector < ActiveRecord::Migration[6.0]
  def change
    add_column :directors, :image_longitude, :float
  end
end
