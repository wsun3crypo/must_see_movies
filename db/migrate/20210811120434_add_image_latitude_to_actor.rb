class AddImageLatitudeToActor < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :image_latitude, :float
  end
end
