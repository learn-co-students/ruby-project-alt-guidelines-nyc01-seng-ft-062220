class MovieClub < ActiveRecord::Base
    belongs_to :movie
    belongs_to :club
end