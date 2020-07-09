require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'pry'

# titles = ["Avengers", "Inception", "Ironman", "Spiderman"]

# search_url = "https://imdb-internet-movie-database-unofficial.p.rapidapi.com/film/"

# titles.each do |n|
  
#   ## this joins the base film url with each movie in the titles array 
#   url = URI.join(search_url, n)
  
#   ## this is how you set up the API call 
#   http = Net::HTTP.new(url.host, url.port)
#   http.use_ssl = true
#   http.verify_mode = OpenSSL::SSL::VERIFY_NONE

#   request = Net::HTTP::Get.new(url)
#   request["x-rapidapi-host"] = 'imdb-internet-movie-database-unofficial.p.rapidapi.com'
#   request["x-rapidapi-key"] = '3b3581b107mshfdddd8da20cb139p170d41jsn1b0c6af1b442'
# ---- 




# "Rocky V".split(" ").join("%20") -- use as example for user input for url for space


  # def self.seed_movie (user_input)

  #   input_url = URI("https://movie-database-imdb-alternative.p.rapidapi.com/?page=1&r=json&s=#{user_input}")
  # # .query.split("&s=")[1]

  #   http = Net::HTTP.new(input_url.host, input_url.port)
  #   http.use_ssl = true
  #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  
  #   request = Net::HTTP::Get.new(input_url)
  #   request["x-rapidapi-host"] = 'movie-database-imdb-alternative.p.rapidapi.com'
  #   request["x-rapidapi-key"] = '9e12ec2159msh69018ee268c2872p1eefffjsne2d01d87e5e6'

  #   response = http.request(request)
  #   data = JSON.pretty_generate(JSON.parse(response.body))
  
  #   res = JSON.parse(data)
  #   id_find = res["Search"]
  #   mov_id = id_find[0]["imdbID"]
  #   res_url = URI("https://movie-database-imdb-alternative.p.rapidapi.com/?i=#{mov_id}&r=json")

  #   http = Net::HTTP.new(res_url.host, res_url.port)
  #   http.use_ssl = true
  #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  #   search_request = Net::HTTP::Get.new(res_url)
  #   search_request["x-rapidapi-host"] = 'movie-database-imdb-alternative.p.rapidapi.com'
  #   search_request["x-rapidapi-key"] = '9e12ec2159msh69018ee268c2872p1eefffjsne2d01d87e5e6'


  #   search_response = http.request(search_request)
  #   search_result = JSON.pretty_generate(JSON.parse(search_response.body))
  #   link_to_imdb = "https://www.imdb.com/title/#{mov_id}/"
  #   # binding.pry
  # end
  
class MovieData

  def self.mov(user_input)
    input_url = URI("https://movie-database-imdb-alternative.p.rapidapi.com/?page=1&r=json&s=#{user_input}")
    # .query.split("&s=")[1]

    http = Net::HTTP.new(input_url.host, input_url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  
    request = Net::HTTP::Get.new(input_url)
    request["x-rapidapi-host"] = 'movie-database-imdb-alternative.p.rapidapi.com'
    request["x-rapidapi-key"] = '9e12ec2159msh69018ee268c2872p1eefffjsne2d01d87e5e6'

    response = http.request(request)
    data = JSON.pretty_generate(JSON.parse(response.body))
    # binding.pry
  
    res = JSON.parse(data)
    imdbid = res["Search"][0]["imdbID"]
    
    res_url = URI("https://movie-database-imdb-alternative.p.rapidapi.com/?i=#{imdbid}&r=json")
    http = Net::HTTP.new(res_url.host, res_url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    search_request = Net::HTTP::Get.new(res_url)
    search_request["x-rapidapi-host"] = 'movie-database-imdb-alternative.p.rapidapi.com'
    search_request["x-rapidapi-key"] = '9e12ec2159msh69018ee268c2872p1eefffjsne2d01d87e5e6'


    search_response = http.request(search_request)
    search_result = JSON.pretty_generate(JSON.parse(search_response.body))
    # binding.pry
    result_data = JSON.parse(search_result)
    if result_data["Type"] == "movie"
      puts title = result_data["Title"]
      puts year = result_data["Year"].to_i
      puts rating = result_data["Rated"]
      puts runtime = result_data["Runtime"].split[0].to_i
      puts genre = result_data["Genre"]
      puts director = result_data["Director"]
      puts writer = result_data["Writer"]
      puts actors = result_data["Actors"]
      puts plot = result_data["Plot"]
      puts language = result_data["Language"]
      puts country = result_data["Country"]
      puts awards = result_data["Awards"]
      puts poster_link = result_data["PosterLink"]
      puts imdb_rating = result_data["imdbRating"].to_f
      puts production = result_data["Production"]
      puts link_to_imdb = "https://www.imdb.com/title/#{imdbid}/"
      Movie.create(imbdid: imdbid, title: title, year: year, rated: rating, runtime: runtime, genre: genre, director: director, writer: writer, actors: actors, plot: plot, language: language, country: country, awards: awards, poster_link: poster_link, imdb_rating: imdb_rating, production: production)
    else
      "Sorry, this search is only for movies"
    end

  end
end
  # movie1 = Movie.create(imbd_ID: "tt8503618", title: "Hamilton", year: 2020, rated: "PG-13", runtime: 160, genre: "Biography, Drama, History", director: "Thomas Kail", writer: "Lin-Manuel Miranda", actors: " Lin-Manuel Miranda", plot: "Alexander Hamilton", language: "English", country: "USA", awards: "yes", poster_link: "https://m.media-amazon.com/images/M/MV5BNjViNWRjYWEtZTI0NC00N2E3LTk0NGQtMjY4NTM3OGNkZjY0XkEyXkFqcGdeQXVyMjUxMTY3ODM@._V1_UX182_CR0,0,182,268_AL_.jpg", imdb_rating: 9.1, production: "Disney")
  # t.string "imbd_ID"
  # t.string "title"
  # t.integer "year"
  # t.string "rated"
  # t.integer "runtime"
  # t.string "genre"
  # t.string "director"
  # t.string "writer"
  # t.string "actors"
  # t.string "plot"
  # t.string "language"
  # t.string "country"
  # t.string "awards"
  # t.string "poster_link"
  # t.float "imdb_rating"
  # t.string "production"

# end

