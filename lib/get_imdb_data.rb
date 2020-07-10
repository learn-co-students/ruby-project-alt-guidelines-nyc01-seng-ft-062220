require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'pry'
  
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
    # binding.pry
    if result_data["Type"] == "movie"
      puts title = "Movie Title: #{result_data["Title"]}"
      puts year = "Release Year: #{result_data["Year"].to_i}"
      puts rating = "Rated: #{result_data["Rated"]}"
      puts runtime = "Runtime: #{result_data["Runtime"].split[0].to_i} minutes"
      puts genre = "Genre: #{result_data["Genre"]}"
      puts director = "Director: #{result_data["Director"]}"
      puts writer = "Writer: #{result_data["Writer"]}"
      puts actors = "Actors/Actresses: #{result_data["Actors"]}"
      puts plot = "Plot: #{result_data["Plot"]}"
      puts language = "Language: #{result_data["Language"]}"
      puts country = "Country: #{result_data["Country"]}"
      puts awards = "Awards: #{result_data["Awards"]}"
      puts poster_link = "Poster Link: #{result_data["Poster"]}"
      puts imdb_rating = "Imdb Rating: #{result_data["imdbRating"].to_f}"
      puts production = "Production: #{result_data["production"]}"
      puts link_to_imdb = "Link to IMDB: https://www.imdb.com/title/#{imdbid}/"
      Movie.create(imbdid: imdbid, title: title, year: year, rated: rating, runtime: runtime, genre: genre, director: director, writer: writer, actors: actors, plot: plot, language: language, country: country, awards: awards, poster_link: poster_link, imdb_rating: imdb_rating, production: production)
    else
      puts "Sorry, this search is only for movies"
    end

  end
end