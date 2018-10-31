class ApplicationController < ActionController::Base
	helper_method :get_default_location, :get_default_weather

	def get_real_ip
		if request.env['REMOTE_ADDR'] === '127.0.0.1'
			return '189.6.22.151'
		else 
			request.env['REMOTE_ADDR']
		end
	end

	def get_default_location
		user_ip_addr = get_real_ip
		# TODO: Move API access_key to env variable
		location_based_on_ip = RestClient.get "http://api.ipstack.com/" + user_ip_addr + "?access_key=ee44ee6ab733dbb5eec01fd1588e3430"
		json = JSON.parse location_based_on_ip

		if !(json['city'].empty?)
			return json['city']
		else
			return 'City not found'
		end
	end

	def get_default_weather
		return "Cloudy with a chance of Deux"
	end
end
