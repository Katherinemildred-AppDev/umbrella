p "Where are you located?"

user_location = gets.chomp
p "Checking the weather at " + user_location + "..." #use user_location = xxx in first draft for temporary permanent location to avoid testing

gmaps_api_endpoint = "https://maps.googleapis.com/maps/api/geocode/json?address=" +user_location + "&key="

# gmaps_api_endpoint = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key="

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
longitude = loc.fetch("lng")

p "Your coordinates are " + latitude.to_s + "," + longitude.to_s

#p after every new line of code

#steps above are standard. modify URL, read it, parse it. common to all APIs.

api_pirate_endpoint= "https://api.pirateweather.net/forecast//" + latitude.to_s + "," + longitude.to_s + "."

raw_response_2 = URI.open(api_pirate_endpoint).read #forgot this

parsed_response = JSON.parse(raw_response_2) #forgot this

current_array= parsed_response.fetch("currently") #forgot this

current_temp=current_array.fetch("temperature")

p "It is currently " + current_temp.to_s + " °F."

#next hour:
