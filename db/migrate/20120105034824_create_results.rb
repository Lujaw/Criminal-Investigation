class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :criminal
      t.string   "name"
      t.string   "gender"
      t.string   "race"
      t.string   "eye_color"
      t.string   "hair_color"
      t.string   "photo"
      t.text     "additional_info"
      t.string   "age"
      t.timestamps
    end
    add_index :results, :criminal_id
  end
end
