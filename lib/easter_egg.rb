class EasterEgg

    def self.greet
        puts "MMMMMMMMMM                  VVV                      MMPMMMMMMMMMM"                          
        puts "M. `MM' .M                   VV                      M'         MM"
        puts "MM.    .MM .d8888b. dP    dP    88d888b. .d8888b.    M  .MMMM   `M"
        puts "MMMb  dMMM 88'  `88 88    88    88'  `88 88ooood8    M          MM"
        puts "MMMM  MMMM 88.  .88 88.  .88    88       88.  ...    M  MMMMM   MM"
        puts "MMMM  MMMM `88888P' `88888P'    dP       `88888P'    M  MMMMM   MM"
        puts "MMMMMMMMMM                                           MMMMMMMMMMMMM"
        puts "\n"
        puts "MPMMMMMMMMM          dP                         dP"
        puts "M'       `M          88                         88 "
        puts "M  MMMMM__M          88                         88 "
        puts "M.      `YM .d8888b. 88d888b. .d8888b. .d8888b. 88 "
        puts "Mmmmmmmm  M 88'  `""   88'  `88 88'  `88 88'  `88 88"
        puts "M. .mmm'  M 88.  ... 88    88 88.  .88 88.  .88 88 "
        puts "Mb.     .dM `88888P' dP    dP `88888P' `88888P' dP"
        puts "MMMMMMMMMMM      "
    end

    def self.are_you_school
        puts "Are you a school (Y/N)?"
        school = gets.chomp
        if school == "Y" || school == "N"
            100.times do
                puts "You're a school and you're full of classrooms and clocks."
            end
        end
    end
    
end

# puts EasterEgg.are_you_school