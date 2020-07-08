class Guest < ActiveRecord::Base
  has_many :reservations
  has_many :restaurants, through: :reservations

  @@guest_id = 0

  def self.who_are_you?
    puts "Please enter your phone number so the system can find you."
    input_phone_number = gets.chomp
    if input_phone_number
      guest = Guest.find_by(phone_number: input_phone_number)
      @@guest_id = guest.id
      make_selection
    else
      puts "Record could not be located. Press enter to try again"
      who_are_you?
    end
  end


  def self.make_selection
    print "\e[2J\e[f"
    puts "Flatiron Restaurant Reservation System"
    puts
    puts "Guest ID: #{@@guest_id}"
    puts "What would you like to do?"
    puts
    puts "1. See all reservations"
    puts "2. Book a reservation"
    puts
    puts
    puts "Please make your selection:"
    input = gets.chomp.to_i
    if input == 1
      see_reservations
    elsif input == 2
      make_reservation
    else
      puts 'Invalid selection, please try again.'
      gets.chomp
    end
  end

  def self.see_reservations
    my_resos = []

    reservations = Reservation.all.select do |item|
      item.guest_id == @@guest_id
    end

    reservations.each do |item|
      restaurant = Restaurant.find_by(id: item.restaurant_id)
      restaurant_name = restaurant.name
      my_resos << restaurant_name
    end
    my_resos.each {|item| puts item}

  end
end