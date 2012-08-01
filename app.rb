require 'sinatra'
require 'json'

require './db'

def user_locations phone_number
  Location.all(:phone_number => phone_number.to_s, :order => [ :created_at.asc ])
end

get "/" do
  erb :index
end

get "/:phone_number.json" do |phone_number|
  content_type :json
  @locations = user_locations phone_number

  {
    :phone_number => phone_number,
    :locations => @locations
  }.to_json
end

get "/:phone_number" do |phone_number|
  @locations = user_locations phone_number
  erb :track
end

post "/:phone_number/:latitude/:longitude" do |phone_number, latitude, longitude|
  content_type :json

  l = Location.new
  l.phone_number = phone_number
  l.latitude = latitude
  l.longitude = longitude
  l.save

  latitude
end
