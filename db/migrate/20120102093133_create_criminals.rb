class CreateCriminals < ActiveRecord::Migration
  def change
    create_table :criminals do |t|
      t.string :name
      t.string :gender
      t.string :race
      t.string :eye_color
      t.string :hair_color
      t.string :photo
      t.text :additional_info
      t.string :age

      t.timestamps
    end
  end
end
