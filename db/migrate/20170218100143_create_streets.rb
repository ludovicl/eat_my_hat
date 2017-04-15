class CreateStreets < ActiveRecord::Migration[5.0]
  def change
    create_table :streets do |t|
      t.string :name
      t.references :zipcode, foreign_key: true
      t.timestamps
    end
    add_index :streets, :name
    add_index :streets, [:name, :zipcode_id], name: 'street_unique_index', unique: true
  end
end
