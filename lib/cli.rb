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

end 
