class MovieClub < ActiveRecord::Base
    belongs_to :clubs_id
    belongs_to :movies_id
end