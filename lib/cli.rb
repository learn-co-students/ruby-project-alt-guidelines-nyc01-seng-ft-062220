require "pry"
require_relative './get_imdb_data.rb'
require_relative './easter_egg.rb'

class CLI

    def self.run
        CLI.greet
    
        puts "If you're into movies, then you've come to the right place!"
        puts "If this your first time here, please type 'create' (without quotes) to create an account."
        puts "\n"
        puts "Otherwise, please type 'login' (without quotes) to log into your account!"
        puts "\n"
        puts "PLEASE REMEMBER ALL ALL COMMANDS ARE CASE SENSITIVE"
        puts "\n"
        puts "You may type 'exit' anytime to exit the program."
        log_create_input = gets.chomp

        case log_create_input
        when "create"
            puts "Let's start with the basics, what's your name?"
            user_gives_name = gets.chomp
            puts "Thanks, #{user_gives_name} please create a username:"
            username_create = gets.chomp
            puts "One more thing, please create a password:"
            user_password_create = gets.chomp
            Member.create(name: "#{user_gives_name}", username: "#{username_create}", password: "#{user_password_create}")
        when "login"
            puts "What's your username?"
            login_username = gets.chomp
            logged_in = CLI.find_my_id(login_username)
            puts "Welcome back, #{logged_in.name}!"
            logged_respond = CLI.menu_options(logged_in)
            puts logged_respond
        when "PFC"
            EasterEgg.greet
            EasterEgg.are_you_school
        end

        case logged_respond
        when "1"
            puts "You chose: View My Current Club"
            puts "You're currently a member of the following club(s): #{CLI.current_club(logged_in)}."
            
        when "2"
            puts "You chose: Search Movies"
            puts "Please type in your search query with correct capatilization and punctuation for the search to work:"
            puts "(Thanks to our movie database sponsors at IMDB)"
            movie_search = gets.chomp
            MovieData.mov(movie_search)
        when "3"
            if CLI.check_club_status(logged_in)
                CLI.leave_club(logged_in)
            else
                puts "Sorry, you can't leave a club without joining one."
            end
        when "4"
            CLI.choose_club_option
            club_input_name = gets.chomp   
            CLI.provide_club_info(club_input_name, logged_in)
            puts "Would you like to join this club? (Y/N)"
            joining_yn = gets.chomp
            exit
        end     

        case club_input_name 
        when "create"
            puts "What's the name of your club?"
            club_name = gets.chomp
            puts "What do you want people to know about your club?"
            club_about = gets.chomp
            puts "How many people are in your club (including yourself)?"
            club_size = gets.chomp
            puts "What is the member capacity of your club?"
            club_cap = gets.chomp
            puts "What day of the week wil be your meeting day?"
            club_day = gets.chomp
            puts "What is your attendance like? If you're the only person in the club, you can put 1."
            club_attend = gets.chomp
            Club.create(name_of_club: "#{club_name}", about_club: "#{club_about}", current_size: "#{club_size}", member_capacity: "#{club_cap}", meetings_day: "#{club_day}", attendance: "#{club_attend}")
        when "search"
            movie_search = gets.chomp
            MovieData.mov(movie_search)
            exit
        end



        case joining_yn
        when "Y" || "y"
            CLI.join_club(logged_in, club_input_name)
            CLI.update_club_count(club_input_name)
            puts "Please contact us via email at clubs.admin@movies.com and we'll pair you with your club host."
        when "N" || "n"
            puts "No problem, we'll exit you out of the program and then you can come back when you're ready to join a different club."
            puts "If you want to join another club or start one of your own, please restart the program!"
            exit
        end

        
        exit
    end

    def self.greet
        puts "M""MMM""MMM""M                dP                                      "
        puts "M  MMM  MMM  M          88                                      "
        puts "M  MMP  MMP  M .d8888b. 88 .d8888b. .d8888b. 88d8b.d8b. .d8888b."
        puts "M  MM'  MM' .M 88ooood8 88 88'  `""   88'  `88 88'`88'`88 88ooood8     "
        puts "M  `' . '' .MM 88.  ... 88 88.  ... 88.  .88 88  88  88 88.  ..."
        puts "M    .d  .dMMM `88888P' dP `88888P' `88888P' dP  dP  dP `88888P'"
        puts "MMMMMMMMMMMMMM                                                  "
    end

    def self.vacancy
        Club.all.select do |c| 
            puts c.name_of_club if c.current_size < c.member_capacity
        end
    end

    def self.provide_club_info(user_club_input, person_name)

        clubid = Club.find_by(name_of_club: "#{user_club_input}").id

        Club.all.each do |club_instance|
            if club_instance.name_of_club == user_club_input
                puts "Hey #{person_name.name}, we're #{club_instance.name_of_club}."
                puts "\n"
                puts "About us: We're all about #{club_instance.about_club} and we meet #{club_instance.meetings_day}."
                puts "We have #{CLI.update_club_count(clubid)} member(s), and hope you would like to be Number #{CLI.update_club_count(clubid) + 1}!"
                puts "The movie we're watching is #{CLI.current_movie(clubid).title} starring #{CLI.current_movie(clubid).actors}, make sure you come with notes for our discussion!"
            end
        end
    end

    def self.join_club(username, club)
        clubid = Club.find_by(name_of_club: "#{club}").id
        ClubMember.create(club_id: clubid, member_id: username.id)
    end

    def self.choose_club_option
        puts "Here's a list of available clubs you can join (case sensitive):"
        puts "\n"
        puts "OR you can type 'create' (without quotes and case sensitive) to create your own club!"
        puts CLI.vacancy
        puts "\n"
        puts "If none of that sounds interesting, you can go ahead and search for a movie!"
    end

    def self.update_club_count(club)
        ClubMember.where(club_id: club).size
    end

    def self.current_movie(club)
        movie = MovieClub.find_by(club_id: club).movie_id 
        Movie.find(movie)
    end

    def self.find_my_id(username)
        userid = Member.find_by(username: username)
    end

    def self.current_club(user)
        find_club = ClubMember.find_by(member_id: user.id)
        find_club ? Club.find(find_club.club_id).name_of_club : "Sorry, you're not a member of a club. You should join one or create one. Please restart the application to do so."
    end

    def self.menu_options(username)
        puts "Hey #{username.name}, here's a menu of options to choose from:"
        puts "Press 1 - View My Current Club"
        puts "Press 2 - Search Movies"
        puts "Press 3 - To Leave a CLub"
        puts "Press 4 - To Join a CLub"
        user_response = gets.chomp
    end

    def self.check_club_status(username)
        ClubMember.find_by(member_id: username.id)
    end

    def self.leave_club(member)
        CLI.check_club_status(member).destroy
    end

    def self.movie_search_and_create(movie_search)
        MovieData.mov(movie_search)
    end

end

    