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
    puts "3. Modify a reservation"
    puts
    puts "Please make your selection:"
    input = gets.chomp.to_i

    if input == 1
      make_reservation
    elsif input == 2
      check_reservations
    elsif input == 3
      find_reservation
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

      final_array.push("#{date} \t\t #{time} \t\t #{party_size} \t \t #{first_name} #{last_name} \t \t \t \t #{phone_number} \t \t #{guest_notes} \t \t \t \t #{reso_notes}")

    end
    puts ("Date \t \t \tTime \t \t Size \t Guest Name \t \t \t \t Phone Number \t \t Guest Notes \t \t \t \t \t \t Reservation Notes       ")
    final_array.each do |item|
      puts item
    end
    puts
    puts "Press enter to continue"
    gets.chomp
    make_selection
  end

  def self.find_reservation
    id = 0

    puts "Please enter the phone number of the Guest:"
    guest_phone = gets.chomp

    guest = Guest.find_by(phone_number: guest_phone)

    if guest
      puts "Guest Found!"
      puts
      puts "#{guest.first_name} #{guest.last_name} - #{guest.phone_number} - #{guest.guest_notes}"
      puts
      puts "Pending Reservations:"
      puts
      reservations = Reservation.all.select {|reso| reso.guest_id == guest.id}
      reservations.each do |item|
        id = item.id
        date = item.date
        time = item.time
        party_size = item.party_size
        notes = item.reservation_notes
        puts "ID: #{id} - #{date} #{time} #{party_size} #{notes}"
      end
      puts
      puts "Would you like to modify this reservation? y/n"
      input = gets.chomp
      if input == 'y'
        modify_reservation(id)
      elsif input == 'n'
        make_selection
      else
        puts "Invalid selection.  Please try again."
        gets.chomp
        find_reservation
      end
    else
    puts "Guest could not be located. Try again? y/n"
    input = gets.chomp
    if input == 'y'
      find_reservation
    else
      make_selection
    end
    end
  end


  def self.modify_reservation(id)
    reservation = Reservation.find_by(id: id)

    puts "What would you like to modify?"
    puts
    puts "1. Date"
    puts "2. Time"
    puts "3. Party Size"
    puts "4. Reservation Notes"
    puts
    input = gets.chomp.to_i
    if input == 1
      puts "Please input new date"
      new_date = gets.chomp
      reservation.date = new_date
      reservation.save
      puts 'Date Updated'

    elsif input == 2
      puts "Please input new time"
      new_time = gets.chomp
      reservation.time = new_time
      reservation.save
      puts 'Time Updated'

    elsif input == 3
      puts "Please input new Party Size"
      new_party = gets.chomp
      reservation.party_size = new_party
      reservation.save
      puts 'Party Size Updated'

    elsif input == 4
      puts "Please input new Reservation Notes"
      new_notes = gets.chomp
      reservation.reservation_notes = new_notes
      reservation.save
      puts 'Notes Updated'

    else
      puts "Invalid selection. Please Try again."
    end
  end


end

