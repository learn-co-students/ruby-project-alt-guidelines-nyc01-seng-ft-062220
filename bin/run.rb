require_relative '../config/environment'

def welcome_message
  puts "Welcome to Flatiron Restaurant"
  puts "Please make your selection:"
  puts
  puts "1. I'm a Restaurant"
  puts "2. I'm a Diner"
  puts
  puts
  puts "Please make your selection: "
  input = gets.chomp.to_i
  if input == 1
    Restaurant.make_selection
  elsif input == 2
    Guest.make_selection
  else
    puts "Invalid selection, please try again."
    welcome_message
  end
end

welcome_message