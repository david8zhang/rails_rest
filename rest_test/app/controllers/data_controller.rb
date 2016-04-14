require 'json'

class DataController < ApplicationController

	@@conn = Faraday.new(:url => "https://autometrica-api.herokuapp.com") do |faraday|
		faraday.request :url_encoded # Form encode POST params
		faraday.response :logger # log request to standard output
		faraday.adapter Faraday.default_adapter # Make requests with Net::HTTP (Make an http request???)
	end

	# Show some data muddafucka
	def show
		response = @@conn.get '/api/v1/data/index', {:data_id => '8def2e5ec7ff524856c825a78207df85fd377438'}
		# Parse out the JSON response
		json = JSON.parse(response.body)
		puts "JSON response: "
		puts json
		@data = json["Items"]
	end

	def create
		puts "Scale: " + params[:scale]
		scale = params[:scale]
		@@conn.post '/api/v1/data/create', {:scale => scale}
		redirect_to "/data/show"
	end

end
