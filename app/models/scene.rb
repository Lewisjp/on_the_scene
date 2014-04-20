class Scene < ActiveRecord::Base
	attr_accessible :IMDB, :agency, :artist, :title, :year, :address, :geolocation_id
	belongs_to :geolocation, class_name: "Geolocation"
end
