class Geolocation < ActiveRecord::Base
  attr_accessible :address, :borough, :latitude, :longitude, :neighborhood
  has_many :scenes, class_name: "Scene"

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
