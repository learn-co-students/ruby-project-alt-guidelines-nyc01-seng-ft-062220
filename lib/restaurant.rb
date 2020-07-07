require 'pry'

class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :guests, through: :reservations

  def self.make_selection
    puts "Flatiron Restaurant Reservation System"
    puts
    puts "What would you like to do?"
    puts
    puts "1. Check Reservations"
    puts "2. Find a Guest"
    puts "3. Make a reservation"
    puts
    puts "Please make your selection:"
    input = gets.chomp.to_i

    if input == 1
      get_names
    elsif input == 2
      find_a_guest
    elsif input == 3
      make_reservation
    else
      "Invalid selection.  Please try again"
      make_selection
    end
  end

  def self.make_reservation
    first_name = 'Tim'
    last_name = 'Cook'
    date = '5/12/2020'
    time = '6PM'
    party_size = 2
    phone_number = 2128675309
    reservation_notes = 'This is a test reso'
    guest_notes = 'This is a test guest'
    guest = Guest.create(first_name: first_name, last_name: last_name, phone_number: phone_number, guest_notes: guest_notes)
  end

  def self.get_names
    puts Restaurant.all
  end

  def self.find_a_guest
    guest = Guest.find_by(phone_number: 2128675309)
  end

end