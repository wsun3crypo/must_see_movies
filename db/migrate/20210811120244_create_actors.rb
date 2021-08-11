class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.text :bio
      t.date :dob
      t.string :image

      t.timestamps
    end
  end
end
