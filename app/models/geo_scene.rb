class GeoScene < ActiveRecord::Base
	attr_accessible :scene_id, :geolocation_id
	belongs_to :scene 
	belongs_to :geolocation
end
