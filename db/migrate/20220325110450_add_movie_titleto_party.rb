class AddMovieTitletoParty < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :movie_title, :string
    add_column :parties, :movie_image, :string
  end
end
