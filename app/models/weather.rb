class Weather < ActiveRecord::Base
  belongs_to :station

  has_one :dewpoint
  has_one :rainfall
  has_one :temperature
  has_one :winddir
  has_one :windspeed
end
