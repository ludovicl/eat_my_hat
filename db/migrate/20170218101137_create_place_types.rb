class CreatePlaceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :place_place_types do |t|
      t.references :place_type, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
    add_index :place_place_types, [:place_id, :place_type_id], name: 'unique_place_place_types', unique: true
  end
end
