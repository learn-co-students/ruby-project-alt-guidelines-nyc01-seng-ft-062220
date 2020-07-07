require_relative '../config/environment'

cli = CommandLineInterface.new
cli.greeting

dealership_name = "Bob's Ford"

cli.rating_of_a_dealership(dealership_name)