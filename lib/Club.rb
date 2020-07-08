class Club < ActiveRecord::Base
    has_many :club_movies
    has_many :movies, through: :club_movies
end