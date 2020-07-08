class Movie < ActiveRecord::Base
    has_many :club_movies
    has_many :clubs, through: :club_movies
end