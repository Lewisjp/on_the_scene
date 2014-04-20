require 'open-uri'

class Api

	def initialize(film)
		api_key = ENV['SECRET_TOKEN']
		# Convert user input into something we can use in the API
		movie = film[0].gsub(/\s/ , "+")
		# Use JSON gem to get data
		@movieAPIdata = JSON.parse(open("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{api_key}&q=#{movie}&page_limit=1").read)
	end

	def runtime
		@movieAPIdata["movies"][0]["runtime"]
	end

	def alt_synopsis 
		if @movieAPIdata["movies"][0]["critics_consensus"].blank? 
			download = open("#{@movieAPIdata["movies"][0]["links"]["alternate"] }")
			html = Nokogiri::HTML(download)
			synopsis = html.at_css('#movieSynopsis').text.strip.delete!("\n").delete!("\t").rpartition("$(function")[0]
			return synopsis
		else
			return @movieAPIdata["movies"][0]["critics_consensus"]
		end
	end

	def synopsis
		if @movieAPIdata["movies"][0]["synopsis"].empty?
			alt_synopsis
		else
			return @movieAPIdata["movies"][0]["synopsis"]
		end
	end

	def rating
		@movieAPIdata["movies"][0]["mpaa_rating"]
	end

	def year
		@movieAPIdata["movies"][0]["year"]
	end

	def poster
		@movieAPIdata["movies"][0]["posters"]["original"]
	end

	def rt_link
		@movieAPIdata["movies"][0]["links"]["alternate"]
		if @movieAPIdata["movies"][0]["synopsis"].empty?
			alt_synopsis 
		else
			return @movieAPIdata["movies"][0]["synopsis"]
		end
	end

	def rating
		@movieAPIdata["movies"][0]["mpaa_rating"]  
	end

	def year
		@movieAPIdata["movies"][0]["year"] 
	end

	def poster
		@movieAPIdata["movies"][0]["posters"]["original"]  
	end

	def rt_link
		@movieAPIdata["movies"][0]["links"]["alternate"] 
	end	
end