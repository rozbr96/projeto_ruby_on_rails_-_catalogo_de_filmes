class CreateDirectors < ActiveRecord::Migration[7.1]
  def change
    create_table :directors do |t|
      t.string :name, null: false
      t.references :nationality, null: false, foreign_key: { to_table: :nationalities }
      t.datetime :birth_date, null: false
      t.references :favorite_genre, null: false, foreign_key: { to_table: :genres }

      t.timestamps
    end
    add_index :directors, :name, unique: true
  end
end
