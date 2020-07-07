class ParkingSpot < ActiveRecords::Base
    has many :statuses 
    has many :drivers, trough: statuses
end