require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  movies = response_hash["results"]

  found_character = movies.find do |character_hash|
    character == character_hash["name"].downcase
  end
  if found_character
    return found_character['films']
  else
    puts "Not Found"
    return nil
end
end



  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.
# binding.pry
# 0

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list

  #  of movies by title. play around with puts out other info about a given film.
  # response_hash["results"][0]["films"]
# binding.pry


def names
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  people = response_hash["results"]
  people.collect do |person|
  person["name"]
  end
end


def print_movies(films_hash)
  # binding.pry
  films_hash.collect do |url|
    response_string = RestClient.get(url)
    response_hash = JSON.parse(response_string)
    # puts response_hash["title"]
# binding.pry
  end

end


def show_character_movies(character)
    films_array = get_character_movies_from_api(character)
    # binding.pry
  if films_array
    print_movies(films_array)
end
end




# puts show_character_movies("R2-D2")
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
