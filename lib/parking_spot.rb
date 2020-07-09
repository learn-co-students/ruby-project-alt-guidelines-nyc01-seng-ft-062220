class ParkingSpot < ActiveRecord::Base
    has_many :statuses 
    has_many :drivers, through: :statuses
end