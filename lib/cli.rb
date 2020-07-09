require "pry"
require "tty-prompt"

class CLI
     
    @@prompt = TTY::Prompt.new

    def self.run
        CLI.greet

        # cm_exit = gets.chomp

        # break if cm_exit == "exit"
    
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
            Member.find_or_create_by(name: "#{user_gives_name}", username: "#{username_create}", password: "#{user_password_create}")
        # when "login"
        #     puts "Please enter your username:"
        #     login_username = gets.chomp
        #     puts "Great, Please enter your password:"
        #     login_password = gets.chomp
        #     find_username = Member.find_by(username: "#{login_username}")
            # if 

            # binding.pry
            # find_password = Member.find_by(password: "#{login_password}").where(username: "#{login_username}").exists?
            # if find_username && find_password
            #     puts "Welcome back!"
            # else
            #     puts "Sorry, we could not find your account, please exit and run the program again. Then, you can either try logging in again or create a new account!"
            # end
        end

        CLI.choose_club_option
        club_input_name = gets.chomp

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
            Club.create(name_of_club: "#{club_name}", about_club: "#{club_about}", current_size: "#{club_size}", member_capacity: "#{club_cap}", meetings_day: "#{club_day}", attendence: "#{club_attend}")
        end

        puts CLI.provide_club_info(club_input_name, user_gives_name)
        puts "Would you like to join this club? (Y/N)"
        joining_yn = gets.chomp

        case joining_yn
        when "Y" || "y"
            CLI.join_club(username_create, club_input_name)
            CLI.update_club_count(club_input_name)
        when "N" || "n"
            puts "No problem, you can exit the program and join a different club."
        end



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
                puts "Hey #{person_name}, we're #{club_instance.name_of_club}."
                puts "\n"
                puts "About us: We're all about #{club_instance.about_club} and we meet #{club_instance.meetings_day}."
                puts "We have #{CLI.update_club_count(clubid)} members, and hope you would like to be Number #{CLI.update_club_count(clubid) + 1}!"
            end
        end
    end

    def self.join_club(username, club)
        user_id = Member.find_by(username: "#{username}").id
        clubid = Club.find_by(name_of_club: "#{club}").id
        ClubMember.create(club_id: clubid, member_id: user_id)
    end

    def self.choose_club_option
        puts "Here's a list of available clubs you can join (case sensitive):"
        puts "\n"
        puts "OR you can type 'create' (without quotes and case sensitive) to create your own club!"
        puts CLI.vacancy
    end

    def self.update_club_count(club)
        # clubid = Club.find_by(name_of_club: "#{club}")
        ClubMember.where(club_id: club).size
        # binding.pry
    end

    # def self.find_my_id
    # end

    # def self.

    # end
    
end