class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string :name

      t.timestamps
    end
    add_index :countries, :name, unique: true
  end
end
