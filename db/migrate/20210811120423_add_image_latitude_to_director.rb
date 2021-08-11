class AddImageLatitudeToDirector < ActiveRecord::Migration[6.0]
  def change
    add_column :directors, :image_latitude, :float
  end
end
