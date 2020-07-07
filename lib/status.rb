class Status < ActiveRecords::Base
    belong_to :parking_spot 
    belong_to :driver
end