require 'httparty'

class Traveler
  include HTTParty
  format :html

  base_uri 'http://localhost:5000'
end

Traveler.post("/0745040691/45/45")
