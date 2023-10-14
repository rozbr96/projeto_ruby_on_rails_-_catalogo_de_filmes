class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.integer :release_year, null: false
      t.text :synopsis, null: false
      t.references :origin_country, null: false, foreign_key: { to_table: :countries }
      t.integer :length, null: false
      t.references :director, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
