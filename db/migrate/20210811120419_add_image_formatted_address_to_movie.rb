class AddImageFormattedAddressToMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :image_formatted_address, :string
  end
end
