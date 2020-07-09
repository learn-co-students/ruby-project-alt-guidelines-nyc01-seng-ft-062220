class CommandLineInterface 

    def greet
      puts "Welcome to the driver community! We help each other to find parking spots in our busy neighbourhood."
      puts "If you are looking for a parking spot, type 'look,'" 
      puts "If you would like to offer one, type 'offer,'"
      puts "You can also delete a parking spot if for some reason you couldn't park your car at that spot, type 'delete'"

      response=gets.strip 
      if response == "look" 
        find
      elsif response == "offer"
        offer
      elsif response == "delete"
        delete
      else 
        puts 'Incorrect input'
        greet
      end
    end 

def available
ParkingSpot.all.select {|spot| spot.available == true}
end

def find
  if available.count > 0  
    puts "Here is the list of available parking spots:" 
    available.map do |spot|
    puts "ID #{spot.id}, '#{spot.location}'', will be available at #{spot.time}"
    end
    reserve
  else 
     puts "Sorry! There are no available parking spots at this time, try later!"
  end
end 

def reserve
  puts "Please choose the one you would like to reserve and enter parking spot id:"
  spot = gets.strip
  spot_id = spot.to_i 
  if available.map{|spot| spot.id}.include? spot_id  #chek if the input match to id of available parking spots
  puts "Enter your id:"
  driver = gets.strip
  driver_id = driver.to_i
if Driver.all.map{|driver| driver.id}.include? driver_id # ckeck if the Driver is already in database
  spot = ParkingSpot.find(spot_id)
  spot.available = false            #change parking_spot  for unavailable
  spot.save
  Status.create(parking_spot_id: spot_id, driver_id: driver_id)  #creating new Status instatces for history 
  puts "Thank you for reservation. Your reservation:  #{spot.location}, at #{spot.time}. "
  else 
    puts "No match. It looks like you are a new user. Enter you name:" 
    name = gets.strip              # if new user, create a new driver and reserve a spot
    new_driver = Driver.create(name: name)
    spot = ParkingSpot.find(spot_id) 
  spot.available = false                #changing parking spot attrubute for unavailable
  spot.save
  Status.create(parking_spot_id: spot_id, driver_id: new_driver.id)   #ccreating new Status instance for history
  puts "Welcome to the community #{name}." 
  puts "You driver id now is #{new_driver.id}. Please remember it for using later on." 
  puts "Your reservation:  #{spot.location}, at #{spot.time}. "
  end
else 
  puts "Incorrect input."
  reserve
end
end

def offer
  puts "Thank you for offering a parking spot."
  puts "Please enter what time the parking spot will be available:"
  time = gets.strip
  puts "Please enter location:"                        
  loc = gets.strip
  if ParkingSpot.all.map {|spot| spot.location}.include? loc     #chek if parking spot is already in database
  spot = ParkingSpot.find_by(location: loc)                      #and make it available by changing attribute
  spot.available = true
  spot.save
  else                                                              #if new location - create new Parking spot
  ParkingSpot.create(available: true, time: time, location: loc)
  end 
  puts "Thank you for creating a new parking spot."
end

def delete 
  puts "Here is the list of available parking spots:" 
  available.map do |spot|
    puts "N #{spot.id}, #{spot.location}, will be available at #{spot.time}"
  end
    puts "Which parking_spot you would like to delete?, Enter id:"
    id = gets.strip 
    ParkingSpot.delete(id)
    puts "Thank you for deleting."
end

end 
