class AddImageLongitudeToActor < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :image_longitude, :float
  end
end
