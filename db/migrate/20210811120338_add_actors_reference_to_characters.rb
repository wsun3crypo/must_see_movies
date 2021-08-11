class AddActorsReferenceToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :characters, :actors, column: :actors_id
    add_index :characters, :actors_id
    change_column_null :characters, :actors_id, false
  end
end
