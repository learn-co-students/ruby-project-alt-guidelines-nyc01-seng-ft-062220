require 'pry'

class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :guests, through: :reservations

  def self.make_selection
    system "cls"
    restaurant = Restaurant.all.select {|rest| rest.name == 'ilili'}
    restaurant.each do |item|
      @restaurant_id = item.id
    end

    puts "Flatiron Restaurant Reservation System"
    puts
    puts "What would you like to do?"
    puts
    puts "1. Make a reservation"
    puts "2. Check Reservations"
    puts "3. Look up Guest History"
    puts
    puts "Please make your selection:"
    input = gets.chomp.to_i

    if input == 1
      make_reservation
    elsif input == 2
      check_reservations
    elsif input == 3
      make_reservation
    else
      "Invalid selection.  Please try again"
      make_selection
    end
  end

  def self.make_reservation
    print "\e[2J\e[f"
    puts "What day would you like?"
    date = gets.chomp
    puts "What time would you like?"
    time = gets.chomp
    puts "How many people in your party?"
    party_size = gets.chomp
    puts "Please enter a first name"
    first_name = gets.chomp
    puts "Please enter a last name"
    last_name = gets.chomp
    puts "Please enter a telephone number"
    phone_number = gets.chomp
    puts "Any special notes about this reservaiton?"
    reservation_notes = gets.chomp
    puts "Any special note about this guest?"
    guest_notes = gets.chomp

    guest = Guest.create(first_name: first_name, last_name: last_name, phone_number: phone_number, guest_notes: guest_notes)
    Reservation.create(date: date, time: time, party_size: party_size, reservation_notes: reservation_notes, guest_id: guest.id, restaurant_id: @restaurant_id )

    puts "Reservation has been booked!"
    puts
    puts "Press enter to continue..."
    gets.chomp
    make_selection
    end


  def self.check_reservations
    test = Reservation.all.select {|reso| reso.restaurant_id == @restaurant_id}

    final_array = []

    test.each do |reso|
      date = reso.date
      time = reso.time
      party_size = reso.party_size
      reso_notes = reso.reservation_notes

      guest = Guest.find_by(id: reso.guest_id)
      first_name = guest.first_name
      last_name = guest.last_name
      phone_number = guest.phone_number
      guest_notes = guest.guest_notes

      final_array.push("#{date} \t #{time} \t #{party_size} \t \t #{first_name} #{last_name} \t \t #{phone_number} \t \t #{guest_notes} \t \t \t \t #{reso_notes}")

    end
    puts ("Date \t \tTime \t Size \t Guest Name       \t Phone Number \t \t Guest Notes        \t \t Reservation Notes       ")
    final_array.each do |item|
      puts item
    end
    puts
    puts "Press enter to continue"
    gets.chomp
    make_selection
  end


end