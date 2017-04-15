class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :link
      t.references :place, foreign_key: true
      t.references :website, foreign_key: true

      t.timestamps
    end
    add_index :reviews, :name
    add_index :reviews, :link
    add_index :reviews, [:name, :link, :place_id, :website_id], name: 'unique_reviews_index', unique: true
  end
end
