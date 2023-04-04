p "Where are you located?"

# user_location = gets.chomp
p user_location = "Taj Mahal" #temporary permanent location to avoid testing

gmaps_api_endpoint = "https://maps.googleapis.com/maps/api/geocode/json?address=" +user_location + "&key=AIzaSyB92cYxPcYqgjwBJfWlwDQw_7yjuyU3tpA"

# gmaps_api_endpoint = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=AIzaSyB92cYxPcYqgjwBJfWlwDQw_7yjuyU3tpA"

gmaps_api_endpoint

require "open-uri"

raw_response = URI.open(gmaps_api_endpoint).read

#turn it into a hash and fetch results
#JSON : give it a string, will return ruby like object. 

require "json"

parsed_response = JSON.parse(raw_response)

results_array = parsed_response.fetch("results")

first_result = results_array.at(0)

geo = first_result.fetch("geometry")

loc=geo.fetch("location")

latitude = loc.fetch("lat")
longitutde = loc.fetch("lng")

p latitude
p longitutde



#p after every new line of code

#steps above are standard. modify URL, read it, parse it. common to all APIs.
