class Club < ActiveRecord::Base
    has_many :movie_clubs
    has_many :movies, through: :movie_clubs
    has_many :club_members
    has_many :members, through: :club_members
end