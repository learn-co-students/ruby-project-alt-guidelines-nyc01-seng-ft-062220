class Movie < ActiveRecord::Base
    has_many :movie_clubs
    has_many :clubs, through: :movie_clubs
end