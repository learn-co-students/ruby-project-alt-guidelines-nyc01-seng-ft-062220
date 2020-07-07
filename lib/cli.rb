class CommandLineInterface
    
    def greeting
        puts "Welcome to LeGoog, the best place for reviews!"
    end

     dealership_name = "Bob's Ford"

    def rating_of_a_dealership(dealership_name)
        # client should see the average rating of a dealership
        # all_reviews = Dealership.find_by(name: "#{dealership_name}").reviews
        # ratings = all_reviews.map {|review| review.rating}.sum
        # avg_rating = (ratings / all_reviews.size).to_f.round(2)
        # if avg_rating < 2
        #     puts "The average rating for #{dealership_name} is #{avg_rating}, maybe you're better off at a better rated dealership."
        # else
        #     puts "The average rating for #{dealership_name} is #{avg_rating}"
        # end
        
    end

    def dealership_own_rating
     # dealership should see it's own rating
    end

    def edit_review
     # client should be able to edit a review
    end

    def delete_review
     # cleint should be able to delete a review
    end

    def dealership_number_of_reviews
     # dealership should be able to see how many reviews they have
    end

    def client_number_of_reviews
     # client should be able to see how many reviews they've left
    end


end

# moonshot - use google api to populate real dealership names and reviews