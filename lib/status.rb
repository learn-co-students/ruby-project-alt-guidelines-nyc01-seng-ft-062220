class Status < ActiveRecord::Base
    belongs_to :parking_spot 
    belongs_to :driver
end