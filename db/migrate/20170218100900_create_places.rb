class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :website
      t.string :map_link
      t.st_point :lonlat, geographic: true
      t.references :street, foreign_key: true

      t.timestamps
    end
    add_index :places, :map_link
    add_index :places, :name
    add_index :places, :website
    add_index :places, :lonlat
    add_index :places, [:name, :street_id], name: 'place_unique_index', unique: true
  end
end
