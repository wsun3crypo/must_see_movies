class AddImageFormattedAddressToDirector < ActiveRecord::Migration[6.0]
  def change
    add_column :directors, :image_formatted_address, :string
  end
end
