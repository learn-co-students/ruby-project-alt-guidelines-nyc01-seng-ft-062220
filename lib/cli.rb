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

end 
