class CommandLineInterface
    
    attr_accessor :client_name, :dealer_name

    def greeting
        puts "Welcome to LeGoog, the best place for reviews!"
        puts "Are you a Client or a Dealership?"
        input = gets.strip
        default = "Hmm, that's not an input we can recognize, please try again."
            if input == "Client"
                client_identity
            elsif input == "Dealership"
                puts "Your secret handshake checks out, here's what you can do:"
                puts " - My_rating : Shows you the rating of your Dealership"
            else
                puts default 
                greeting  
            end
    end


    def exit
        puts "Thanks for using our service, goodye!"
    end


    # ***** CLIENT METHODS *****

    def client_identity
        puts "Here's a list of all of our clients : "
        puts Client.all.map {|client| puts client.name}.compact
        puts "Which one are you? :"
            input = gets.strip
            @@client_name = input
        if Client.find_by(name: @@client_name)
            client_interface
        else
            puts "Sorry, you're not in our databese."
        end
    end

    def client_interface
                puts "Hello, #{@@client_name} here's what we can do for you:"
                puts " - My_reviews : Shows you how many reviews you have in total."
                puts " - How_many : Shows you the number of reviews you've left"
                puts " - Write : Write a new review."
                puts " - Edit : Edit a review you've previously left."
                puts " - Delete : Delete a review you've previously left'"
                puts " - Dealership_reviews : View all of the reviews for a specific dealership"
                puts " - Help : Lists available commands."
                puts " - Exit : Exits the system"
                client_run
    end

    def client_continue
        puts "Would you like to do anything else? Please answer Yes or No"
            input = gets.strip
                if input == "Yes"
                    client_run
                end
                exit
    end

    def client_run
        puts "What would you like to do? :"
        puts "Remember, you can type Help to get a list of commands."    
        input = gets.strip
    
        if input == "My_reviews"
            puts "Here's a list of all of your reviews."
            pp client_reviews
            client_run
        elsif input == "How_many"
            if client_reviews_count < 1
                puts "You have one review."
            else
                puts "You have a total of #{client_reviews_count} reviews."
            end
            client_run
        elsif input == "Write"
            create_review
        elsif input == "Edit"
            edit_review
        elsif input == "Delete"
            delete_review
        elsif input == "Dealership_reviews"
            dealership_reviews 
        elsif input == "Help"
            client_interface
        elsif input == "Exit"
            exit
        end
    end

    def rating_of_a_dealership(dealership_name)
        # client should see the average rating of a dealership
        all_reviews = Dealership.find_by(name: "#{dealership_name}").reviews
        ratings = all_reviews.map {|review| review.rating}.sum
        avg_rating = (ratings / all_reviews.size).to_f.round(2)
        if avg_rating < 2
            puts "The average rating for #{dealership_name} is #{avg_rating}, maybe you're better off at a better rated dealership."
        else
            puts "The average rating for #{dealership_name} is #{avg_rating}"
        end
        client_continue
    end

    def client_reviews
        # client should be able to see how many reviews they've left.
        pp Client.find_by(name: @@client_name).reviews
        client_continue
    end

    def client_reviews_count
        # client should be able to see how many reviews they've left.
        pp Client.find_by(name: @@client_name).reviews.count
        client_continue
    end

    def create_review
        puts "Sure, lets write a new review!"
        puts "Which Dealership would you like to write a review for?"
            input = gets.strip
                dealership = Dealership.find_by(name: input).id
                client = Client.find_by(name: @@client_name).id
                if Dealership.find_by(name: input)
                    puts "What would like to say?"
                        text = gets.strip
                            puts "What you like to rate the Dealership from 1-10?"
                                rating = gets.strip
                                    puts "Perfect, thank you! Here is your new review:"
                                        Review.create(text_body: text, rating: rating, dealership_id: dealership, client_id: client)
                else
                    Dealership.create(name: input, brand: input, location: Brooklyn_NY, phone: 444-6790)
                    puts "What would like to say?"
                    text = gets.strip
                        puts "What you like to rate the Dealership from 1-10?"
                            rating = gets.strip
                                puts "Perfect, thank you! Here is your new review:"
                                    Review.create(text_body: text, rating: rating, dealership_id: dealership, client_id: client)
                end
    end

    # def create_dealership
    #     Dealership.create
    # end

    def edit_review
     # client should be able to edit a review.
        puts "Which review would you like to edit?"
        pp Client.find_by(name: @@client_name).reviews
        puts "Please enter the ID"
        input = gets.strip
            selected_review = Review.find_by(id: input)
            puts "What would you like for the new review to say?"
                input = gets.strip
                    selected_review.update(text_body: input)
                    puts "Your review has been updated, here's the new review:"
                    pp selected_review
        client_continue
    end

    def delete_review
     # cleint should be able to delete a review.
     puts "Which review would you like to delete?"
        pp Client.find_by(name: @@client_name).reviews
        puts "Please enter the ID"
            input = gets.strip
                selected_review = Review.find_by(id: input)
                selected_review.destroy
                puts "Review has been deleted. Here all of the remaining reviews."
                pp Client.find_by(name: @@client_name).reviews
        client_continue
    end

    def dealership_reviews
        # client should be able to see the reviews a dealership has.
        puts "Sure, which Dealership? :"
            input = gets.strip
                dealership_own_rating(input)
        client_continue
    end


    # ****** DEALERSHIP METHODS *****

    def dealership_interface
        puts "Here's a list of all of our dealerships : "
        puts Client.all.map {|client| puts client.name}.compact
        puts "Which one are you? :"
            input = gets.strip
            @@dealer_name = input
    end

    def dealership_own_rating(dealership_name)
        # dealership should see it's own rating
        if Dealership.find_by(name: dealership_name) && Dealership.find_by(name: dealership_name).reviews != []
            all_reviews = Dealership.find_by(name: "#{dealership_name}").reviews
            ratings = all_reviews.map {|review| review.rating}.sum
            avg_rating = (ratings / all_reviews.size).to_f.round(2)
            puts "The Deaership has a rating of #{avg_rating}."
            puts "Here are all of the reviews for #{dealership_name}:"
            pp Dealership.find_by(name: dealership_name).reviews
        else
            puts "Hmm, we can't find that Dealership or that Dealership doesn't have any reviews yet.\n Would you like to be the first to write a review for them?\n Please Type Yes or No"
                input = gets.strip
                    if input == "Yes"
                        create_review
                    else
                        client_continue
                    end
        end
    end


end

# moonshot - use google api to populate real dealership names and reviews