require 'httparty'

class Traveler
  include HTTParty
  format :html

  base_uri 'http://localhost:5000'
end

puts Traveler.post("/0745040692/45/15")
