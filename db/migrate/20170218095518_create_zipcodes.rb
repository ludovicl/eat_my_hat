class CreateZipcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :zipcodes do |t|
      t.string :name
      t.references :city, foreign_key: true

      t.timestamps
    end
    add_index :zipcodes, :name
    add_index :zipcodes, [:name, :city_id], name: 'zipcode_unique_index', unique: true
  end
end
