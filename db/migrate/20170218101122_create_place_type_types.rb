class CreatePlaceTypeTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :place_types do |t|
      t.string :name

      t.timestamps
    end
    add_index :place_types, :name, name: 'unique_place_types_index', unique: true
  end
end
