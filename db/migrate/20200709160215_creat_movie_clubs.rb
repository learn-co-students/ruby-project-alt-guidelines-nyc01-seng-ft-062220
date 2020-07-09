class CreatMovieClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_clubs do |t|
      t.integer :movie
      t.integer :club
    end
  end
end
