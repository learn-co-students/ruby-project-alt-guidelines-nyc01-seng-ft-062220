class TrainStation < ActiveRecord::Base
    has_many :favorite_stations
    has_many :users, through: :favorite_stations
end