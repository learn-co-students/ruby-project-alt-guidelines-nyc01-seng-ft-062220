require_relative '../lib/Movie.rb'
require 'pry'
Movie.destroy_all
Club.destroy_all
Member.destroy_all
MovieClub.destroy_all
ClubMember.destroy_all

movie1 = Movie.create(imbd_ID: "tt8503618", title: "Hamilton", year: 2020, rated: "PG-13", runtime: 160, genre: "Biography, Drama, History", director: "Thomas Kail", writer: "Lin-Manuel Miranda", actors: " Lin-Manuel Miranda", plot: "Alexander Hamilton", language: "English", country: "USA", awards: "yes", poster_link: "https://m.media-amazon.com/images/M/MV5BNjViNWRjYWEtZTI0NC00N2E3LTk0NGQtMjY4NTM3OGNkZjY0XkEyXkFqcGdeQXVyMjUxMTY3ODM@._V1_UX182_CR0,0,182,268_AL_.jpg", imdb_rating: 9.1, production: "Disney")
movie2 = Movie.create(imbd_ID: "tt0079817", title: "Rocky II", year: 1979, rated: "PG", runtime: 119, genre: "Drama, Sport", director: "Sylvester Stallone", writer: "Sylvester Stallone", actors: "Sylvester Stallone, Talia Shire, Burt Young, Carl Weathers", plot: "Rocky struggles in family life after his bout with Apollo Creed...", language: "English", country: "USA", awards: "2 wins & 2 nominations.", poster_link: "https://m.media-amazon.com/images/M/MV5BOTZmYzA4N2YtMzA1NS00OTU0LWJiNWItNDUxOWRiMGVjZjJkL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg", imdb_rating: 7.3, production: "United Artists")

club1 = Club.create(name_of_club: "Film Club", about_club: "Watch films", current_size: 10, member_capacity: 15, meetings_day: "Friday", attendence: 7)
club2 = Club.create(name_of_club: "New York, New York", about_club: "Only New York movies", current_size: 4, member_capacity: 7, meetings_day: "Monday", attendence: 3)
club3 = Club.create(name_of_club: "At capacity", about_club: "old movies", current_size: 7, member_capacity: 7, meetings_day: "Tuesday", attendence: 7)

member1 = Member.create(name: "John Doe", username: "johndoe", password: "password")
member2 = Member.create(name: "Jane Fakeman", username: "jane", password: "fake")

club_members1 = ClubMember.create(club: club1, member: member1)
club_members2 = ClubMember.create(club: club2, member: member2)

movie_clubs1 = MovieClub.create(movie: movie1, club: club1)
movie_clubs2 = MovieClub.create(movie: movie2, club: club2)
binding.pry