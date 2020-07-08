require_relative '../config/environment'

def welcome_message
  system("clear")
  puts "FLATIRON RESTAURANT RESERVATION SYSTEM"
  puts
  puts "Please make your selection:"
  puts
  puts "1. I'm a Restaurant"
  puts "2. I'm a Diner"
  puts
  puts
  puts "Please make your selection: "
  input = gets.chomp.to_i
  if input == 1
    Restaurant.who_are_you?
  elsif input == 2
    Guest.who_are_you?
  else
    puts "Invalid selection, please try again."
    welcome_message
  end
end

welcome_message