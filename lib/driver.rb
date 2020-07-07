class Driver < ActiveRecords::Base
    has many :statuses 
    has many :parking_spots, trough: statuses
end