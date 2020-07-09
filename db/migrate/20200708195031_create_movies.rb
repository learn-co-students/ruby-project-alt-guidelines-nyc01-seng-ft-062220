class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :imbd_ID
      t.string :title
      t.integer :year
      t.string :rated
      t.integer :runtime
      t.string :genre
      t.string :director
      t.string :writer
      t.string :actors
      t.string :plot
      t.string :language
      t.string :country
      t.string :awards
      t.string :poster_link
      t.float :imdb_rating
      t.string :production
    end
  end
end
