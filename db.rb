require 'data_mapper'
require 'dm-timestamps'

DataMapper.setup(:default, 'sqlite::memory:')

class Location
  include DataMapper::Resource

  property :id,    Serial
  property :phone_number, String, :required => true
  property :latitude, Float, :default  => 0
  property :longitude, Float, :default  => 0
  property :created_at, DateTime
end

Location.auto_migrate!

# seeds below

