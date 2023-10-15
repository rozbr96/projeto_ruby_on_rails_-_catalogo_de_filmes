class AddReleasedToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :has_been_released, :boolean
  end
end
