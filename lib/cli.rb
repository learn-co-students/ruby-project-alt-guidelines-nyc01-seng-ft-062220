# TODO:

    # :cant cancel new account
    # :clients with same name break the app



class CommandLineInterface
    


    # ***** CLIENT INTERFACE METHODS *****

    attr_accessor :client_name
    
    def client_greeting
        #with dealership tree disabled
        puts "** Welcome to LeGoog, the best place for reviews! **".yellow
        puts "** Please select your name from the list below to get access to your account. **".yellow
        client_identity
    end

    def client_exit
        puts "** Thanks for using our LeGoog, goodye! **"
    end

    def client_identity
        puts "** Here's a list of all of our clients : **".yellow
        puts Client.all.map {|client| puts client.name}.compact
        puts "** What's your name? : **"
            input = gets.strip.capitalize
            @@client_name = input
            #@@client_id = 
        if Client.find_by(name: @@client_name)
            client_interface
        else
            puts "** Hmm, we can't find you in our databese. **"
            puts "** Would you like to create a new profile for yourself? **"
            puts "** Please type Yes or No **".red
                input = gets.chomp.upcase
                    if input == "YES"
                        create_client
                    else
                        client_exit
                    end
        end
    end

    def client_interface
                puts "**  Hello, #{@@client_name} here's what we can do for you:                                 **"
                puts "**   - My_reviews : Shows you how many reviews you have in total.               **".yellow
                puts "**   - How_many : Shows you the number of reviews you've left.                  **".yellow
                puts "**   - Write_review : Write a new review.                                       **".yellow
                puts "**   - Edit_review : Edit a review you've previously left.                      **".yellow
                puts "**   - Delete_review : Delete a review you've previously left.                  **".yellow
                puts "**   - Dealership_reviews : View all of the reviews for a specific dealership.  **".yellow
                puts "**   - Dealership_rating : Rating for a specific dealership.                    **".yellow
                puts "**   - Edit_account : Change information associated with your account.          **".yellow
                puts "**   - Delete_account : You can delete your account if you'd like.              **".yellow 
                puts "**   - Help : Lists available commands.                                         **".yellow
                puts "**   - Exit : Exits the system.                                                 **".yellow
                client_run
    end

    def client_continue
        puts "**  Would you like to do anything else?   **" 
        puts "**  Please type Yes or No  **".red
            input = gets.strip.upcase
            case
            when input == "YES"
                    client_run
            when input == "NO"
                    client_exit
            else
                    puts "**  Hmm, we didn't recognize that input.  **".red
                    client_run
            end
    end

    def client_run
        puts "**  What would you like to do? :  **"
        puts "**  Remember, you can type Help to get a list of commands.  **".yellow
        input = gets.chomp.upcase
    
        if input == "MY_REVIEWS"
            client_reviews
        elsif input == "HOW_MANY"
            if client_reviews_count >= 1
                client_continue
            else
                puts "**  Would you like to create a new review?  **"
                puts "**  Please answer Yes or No  **".red
                    input = gets.chomp.upcase
                    if input == "YES"
                        create_review
                    else
                        client_continue
                    end
            end
        elsif input == "WRITE_REVIEW"
            create_review
        elsif input == "EDIT_REVIEW"
            edit_review
        elsif input == "DELETE_REVIEW"
            delete_review
        elsif input == "DEALERSHIP_REVIEWS"
            dealership_reviews 
        elsif input == "DEALERSHIP_RATING"
            rating_of_a_dealership
        elsif input == "EDIT_ACCOUNT"
            edit_client
        elsif input == "DELETE_ACCOUNT"
            delete_client
        elsif input == "HELP"
            client_interface
        elsif input == "EXIT"
            client_exit
        else
            puts "**  Hmm, we didn't recognize that input.  **".red
            client_continue
        end
    end

    # ***** CREATE METHODS *****


    def create_review
        puts "**  Sure, lets write a new review!  **"
        puts "**  Here's a list of existing dealerships that you can leave a review for.\n You can also type New, to write a review for a dealership that's not in our directory yet. :  **"
          puts Dealership.all.map {|dealer|dealer.name}
            input = gets.strip
                if Dealership.find_by(name: input)
                    dealership = Dealership.find_by(name: input).id
                    client = Client.find_by(name: @@client_name).id
                    puts "**  What would like to say?  **"
                        text = gets.strip
                                puts "**  How would you rate this Dealership from 1-5?  **"
                                rating = gets.chomp.to_i
                                    while rating > 5 || rating <= 0 
                                        puts "**  Please make sure your rating is between 1 and 5.  **".red
                                        rating = gets.chomp.to_i
                                    end
                                puts "**  Perfect, thank you! Here is your new review:  **"
                                Review.create(text_body: text, rating: rating, dealership_id: dealership, client_id: client)
                                client_continue
                elsif input == "NEW"
                    create_dealership
                end
    end

    
    def create_client
        puts "**  Let's make a new profile for you.  **\n **  What's your name? :  **"
            @@client_name = gets.strip.capitalize
                puts "**  Great, and what's your email?  **"
                    email = gets.strip
                        puts "**  Fantasic, and lastly, what's your phone number?  **"
                            phone = gets.strip
        Client.create(name: @@client_name, email: email, phone: phone)
        client_identity
    end

    def create_dealership
        puts "**  Let's add this dealership to our database.\n What is the name of the dealership?  **"
            name = gets.strip
                puts "**  What is the brand that the dealership sells?  **"
                    brand = gets.strip
                        puts "**  What is the location of the dealership?  **"
                            location = gets.strip
                                puts "**  Lastly, what is the phone number to the dealership?  **"
                                    phone = gets.strip
        Dealership.create(name: name, brand: brand, location: location, phone: phone)
        create_review
    end

    def would_you_like_to_review?
        puts "**  Hmm, we can't find that Dealership or that Dealership doesn't have any reviews yet.  **"
        puts "**  Would you like to be the first to write a review for them?  **"
        puts "** Please type Yes or No  **".red
            input = gets.strip.upcase
                if input == "YES"
                    create_review
                end
        client_continue
    end



    # ***** EDIT METHODS *****

    def edit_review
     # client should be able to edit a review.
     if Client.find_by(name: @@client_name).reviews != []
        puts "**  Which review would you like to edit?  **"
        pp Client.find_by(name: @@client_name).reviews
        puts "**  Please enter the dealership ID  **"
        input = gets.strip
            selected_review = Review.find_by(id: input)
            puts "**  What would you like for the new review to say?  **"
                input = gets.strip
                    selected_review.update(text_body: input)
                    puts "**  Your review has been updated, here's the new review:  **"
                    pp selected_review
                    client_continue
     else
        puts "**  Hmm, it looks like you don't have any reviews yet!  **"
        client_continue
     end
    end

    def edit_client
        client = Client.find_by(name: @@client_name)
        puts "**  What would you like to update? Your Name, Email or Phone?  **"
            input = gets.strip.upcase
                case
                when input == "NAME"
                    puts "**  Please enter a new name. :  **"
                        name = gets.strip.capitalize
                            @@client_name = name
                            client.update(name: name)
                when input == "EMAIL"
                    puts "**  Please enter a new email address. :  **"
                        email = gets.strip
                            client.update(email: email)
                when input == "PHONE"
                    puts "**  Please enter a new phone number. :  **"
                        phone = gets.strip
                            client.update(phone: phone)
                else
                    puts "**  Hmm, we don't recognize that input.  **".red
                    edit_client
                end
        puts "**  Here is your updated account. : **"
        pp client
        client_continue
    end


    # ***** DELETE METHODS *****

    def delete_review
        # cleint should be able to delete a review.
        if Client.find_by(name: @@client_name).reviews != []
            puts "**  Which review would you like to delete?  **"
                pp Client.find_by(name: @@client_name).reviews
                    puts "**  Please enter the ID"
                        input = gets.strip
                            selected_review = Review.find_by(id: input)
                                selected_review.destroy
                                    puts "**  Review has been deleted. Here all of the remaining reviews.  **"
                                        pp Client.find_by(name: @@client_name).reviews
                                            client_continue
        else
            puts "**  Hmm, it looks like you don't have any reviews yet.  **"
            client_continue
        end
    end

    def delete_client
        puts "** Are you sure you want to delete your account?  **".red
        puts "** Type YES to confirm or NO to cancel.  **"
            input = gets.strip
                if input == "YES" 
                    client = Client.find_by(name: @@client_name)
                    client.destroy
                    puts "**  We're sorry to see you go!  **"
                    client_exit
                else
                    client_continue
                end
    end



    # ***** READ METHODS *****


    def rating_of_a_dealership
        # client should see the average rating of a dealership
       puts "**  Sure, which Dealership? :  **"
            puts Dealership.all.map {|dealer| dealer.name}.compact
                input = gets.strip
                all_reviews = Dealership.find_by(name: "#{input}").reviews
                ratings = all_reviews.map {|review| review.rating}.sum
                if ratings > 0
                    avg_rating = (ratings / all_reviews.size).to_f.round(2)
                    if avg_rating < 2
                        puts "**  The average rating for #{input} is #{avg_rating}, maybe you'd better off at a better rated dealership.  **"
                    else
                        puts "**  The average rating for #{input} is #{avg_rating}.  **"
                    end
                else
                    would_you_like_to_review?
                end
    end

    def client_reviews
        # client should be able to see how many reviews they've left.
        if Client.find_by(name: @@client_name).reviews != []
            puts "**  Here's a list of all of your reviews.  **".blue
            pp Client.find_by(name: @@client_name).reviews
        else
            puts "** You haven't left any reviews yet. **"
        end
        client_continue
    end

    def client_reviews_count
        # client should be able to see how many reviews they've left.
        count = Client.find_by(name: @@client_name).reviews.count
        puts "**  You have a total of #{count} reviews.  **"
        count
    end

    def dealership_reviews
        # client should be able to see the reviews a dealership has.
        puts "**  Sure, which Dealership? :  **"
            puts Dealership.all.map {|dealer| dealer.name}.compact
            input = gets.strip
                dealership_own_rating(input)
    end

    def dealership_own_rating(dealership_name)
        # dealership should see it's own rating
        if Dealership.find_by(name: dealership_name) && Dealership.find_by(name: dealership_name).reviews != []
            all_reviews = Dealership.find_by(name: "#{dealership_name}").reviews
            id = Dealership.find_by(name: "#{dealership_name}").id
                puts "**  Here are all of the reviews for #{dealership_name}:  **".blue
                text = Review.all.select {|dealer| dealer.dealership_id == id}
                puts text.map {|store| store.text_body}
            client_continue
        else
            would_you_like_to_review?
        end
    end


    # ****** DEALERSHIP METHODS *****

        # def greeting
    #     # with dealership tree enabled
    #     puts "Welcome to LeGoog, the best place for reviews!"
    #     puts "Are you a Client or a Dealership?"
    #     input = gets.strip
    #     default = "Hmm, that's not an input we can recognize, please try again."
    #         if input == "Client"
    #             client_identity
    #         elsif input == "Dealership"
    #             puts "Your secret handshake checks out, here's what you can do:"
    #             puts " - My_rating : Shows you the rating of your Dealership"
    #         else
    #             puts default 
    #             greeting  
    #         end
    # end

    # Turned off this feature. Focusing on client side.

    # def dealership_interface
    #     puts "Here's a list of all of our dealerships : "
    #     puts Client.all.map {|client| puts client.name}.compact
    #     puts "Which one are you? :"
    #         input = gets.strip
    #         @@dealer_name = input
    # end




end

