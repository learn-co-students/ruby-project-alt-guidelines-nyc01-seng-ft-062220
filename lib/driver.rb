class Driver < ActiveRecord::Base
    has_many :statuses
    has_many :parking_spots, through: :statuses
end



