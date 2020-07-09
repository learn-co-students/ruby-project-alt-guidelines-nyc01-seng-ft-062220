class RenameMovieClubsColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :movie_clubs, :movie, :movie_id
    rename_column :movie_clubs, :club, :club_id
  end
end
