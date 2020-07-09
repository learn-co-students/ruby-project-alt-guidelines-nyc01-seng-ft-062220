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
def seed_movie (user_input)

  input_url = URI("https://movie-database-imdb-alternative.p.rapidapi.com/?page=1&r=json&s=#{user_input}")
  # .query.split("&s=")[1]

  http = Net::HTTP.new(input_url.host, input_url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  
  request = Net::HTTP::Get.new(input_url)
  request["x-rapidapi-host"] = 'movie-database-imdb-alternative.p.rapidapi.com'
  request["x-rapidapi-key"] = '9e12ec2159msh69018ee268c2872p1eefffjsne2d01d87e5e6'

  response = http.request(request)
  puts data = JSON.pretty_generate(JSON.parse(response.body))
  
  res = JSON.parse(data)
  id_find = res["Search"]
  mov_id = id_find[0]["imdbID"]
  res_url = URI("https://movie-database-imdb-alternative.p.rapidapi.com/?i=#{mov_id}&r=json")

  http = Net::HTTP.new(res_url.host, res_url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  search_request = Net::HTTP::Get.new(res_url)
  search_request["x-rapidapi-host"] = 'movie-database-imdb-alternative.p.rapidapi.com'
  search_request["x-rapidapi-key"] = '9e12ec2159msh69018ee268c2872p1eefffjsne2d01d87e5e6'


  search_response = http.request(search_request)
  puts search_result = JSON.pretty_generate(JSON.parse(search_response.body))
  puts link_to_imdb = "https://www.imdb.com/title/#{mov_id}/"
  # binding.pry
end

# puts seed_movie("Rocky II")