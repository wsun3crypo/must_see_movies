class AddImageFormattedAddressToActor < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :image_formatted_address, :string
  end
end
