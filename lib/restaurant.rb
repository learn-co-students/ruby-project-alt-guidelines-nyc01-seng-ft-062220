class Restaurant < ActiveRecord::Base
  has_many :reservations

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
      check_reservations
    elsif input == 2
      find_a_guest
    elsif input == 3
      make_reservation
    else
      "Invalid selection.  Please try again"
      make_selection
    end
  end

  def self.find_a_guest
    puts "Please enter guest's phone number:"
    input = gets.chomp.to_i
    Guest.find_by(phone_number: input)
  end



end

