class FavoriteStation < ActiveRecord::Base
    belongs_to :user
    belongs_to :train_station
end