require 'data_mapper'
require 'dm-timestamps'
require 'date'

DataMapper.setup(:default, 'sqlite::memory:')

class Location
  include DataMapper::Resource

  property :id,    Serial
  property :phone_number, String, :required => true
  property :latitude, Float, :default  => 0
  property :longitude, Float, :default  => 0
  property :created_at, DateTime

  def pretty
    {
      :phone_number => phone_number,
      :time_ago => created_at.to_s[0...-6] + "Z", #.strftime("%Y-%m-%dT%H:%M:%SZ")
      :latitude => latitude,
      :longitude => longitude
    }
  end
end

Location.auto_migrate!

# seeds below
