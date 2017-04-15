class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.references :country, foreign_key: true

      t.timestamps
    end
    add_index :cities, :name
    add_index :cities, [:name, :country_id], name: 'city_unique_index', unique: true
  end
end
