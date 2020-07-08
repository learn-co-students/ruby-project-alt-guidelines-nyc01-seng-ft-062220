class Guest < ActiveRecord::Base
  has_many :reservations
  has_many :restaurants, through: :reservations

  @@guest = []

  def self.who_are_you?
    puts "Please enter your phone number so the system can find you."
    input_phone_number = gets.chomp
    guest = Guest.find_by(phone_number: input_phone_number)
    if guest.nil? == false
      @@guest = guest
      make_selection
    else
      puts "Record could not be located. Press enter to try again"
      who_are_you?
    end
  end

  def self.make_selection
    print "\e[2J\e[f"
    puts
    puts "FLATIRON RESTAURANT RESERVATION SYSTEM"
    puts
    puts "Welcome back #{@@guest.first_name} #{@@guest.last_name}"
    puts "What would you like to do?"
    puts
    puts "1. See all reservations"
    puts "2. Book an online reservation"
    puts "3. Return to main menu"
    puts
    puts
    puts "Please make your selection:"
    input = gets.chomp.to_i
    if input == 1
      see_reservations
    elsif input == 2
      make_reservation
    elsif input == 3
      welcome_message
    else
      puts 'Invalid selection, please try again.'
      gets.chomp
    end
  end

  def self.see_reservations
    my_resos = []

    reservations = Reservation.all.select do |item|
      item.guest_id == @@guest.id
    end

    reservations.each do |item|
      restaurant = Restaurant.find_by(id: item.restaurant_id)
      restaurant_name = restaurant.name
      my_resos << "#{restaurant_name} - #{item.date} - #{item.time} - #{item.party_size}"
    end
    puts
    puts
    my_resos.each {|item| puts item}
    puts
    puts
    puts "Press enter to continue."
    gets.chomp
    make_selection
  end

  def self.make_reservation
    restaurants = []
    Restaurant.all.each do |restaurant|
      restaurants << restaurant.name
    end
    puts "Please select a restaurant to book"
    index = 1
    restaurants.each do |item|
        puts "#{index}. #{item}"
      index += 1
    end
    puts
    puts "Please select which restaurant to book."
    input = gets.chomp.to_i
    selected_restaurant = restaurants[input - 1]
    puts "You have selected #{selected_restaurant}"

    rest_object = Restaurant.find_by(name: selected_restaurant)
    guest_object = Guest.find_by(id: @@guest)

    Reservation.create(date: '8/15/2020', time:"5PM", party_size: 6, reservation_notes: 'Anniversary Dinner', guest: guest_object, restaurant: rest_object)

    puts "Reservation booked! Press enter to continue."
    gets.chomp
    make_selection
  end

end