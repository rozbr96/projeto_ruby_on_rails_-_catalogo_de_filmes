class CreateNationalities < ActiveRecord::Migration[7.1]
  def change
    create_table :nationalities do |t|
      t.string :name, null: false
      t.references :country, null: false, foreign_key: { to_table: :countries }

      t.timestamps
    end
    add_index :nationalities, :name, unique: true
  end
end
