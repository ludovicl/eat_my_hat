class CreateWebsites < ActiveRecord::Migration[5.0]
  def change
    create_table :websites do |t|
      t.string :name
      t.string :link

      t.timestamps
    end
    add_index :websites, :name, unique: true
    add_index :websites, :link
  end
end
