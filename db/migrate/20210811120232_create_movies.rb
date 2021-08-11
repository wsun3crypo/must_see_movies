class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.text :description
      t.integer :director_id
      t.string :title
      t.string :year
      t.string :duration
      t.string :image
      t.string :numbers_of_characters

      t.timestamps
    end
  end
end
