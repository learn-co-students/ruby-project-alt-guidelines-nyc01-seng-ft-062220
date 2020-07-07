class Guest < ActiveRecord::Base
  has_many :reservations
end