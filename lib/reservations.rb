class Reservation < ActiveRecord::Base
  belongs_to :guests
  belongs_to :restaurants
end