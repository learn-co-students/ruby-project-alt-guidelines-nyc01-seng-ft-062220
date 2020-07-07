class User < ActiveRecord::Base
    has_many :favorite_stations
    has_many :train_stations, through: :favorite_stations
end