class ApplicationController < ActionController::Base
	helper_method :get_default_location, :get_default_weather

	def get_real_ip
		if request.env['REMOTE_ADDR'] === '127.0.0.1'
			return '189.6.22.151'
		else 
			return request.remote_ip
		end
	end

	def get_location_info_for_ip
		user_ip_addr = get_real_ip
		# TODO: Move API access_key to env variable
		location_for_ip = RestClient.get "http://api.ipstack.com/" + user_ip_addr + "?access_key=ee44ee6ab733dbb5eec01fd1588e3430"
		info = JSON.parse location_for_ip
		return info
	end

	def get_city_for_ip
		info = get_location_info_for_ip
		if info['city'].present?		
			return info['city']
		else
			return 'City not found'
		end
	end

	def get_latitude_longitude_for_ip
		info = get_location_info_for_ip
		return info['latitude'], info['longitude']
	end 

	# we get climate by lat and long instead of city name or ID in order to avoid duplicates errors or record not found incompatibilities
	# between third-party APIs
	def get_weather_for_latitude_longitude
		latitude, longitude = get_latitude_longitude_for_ip
		if !(latitude.present?) or !(longitude.present?)
			return "Climate couldn't be determined: Lack of information"
		else
			weather_based_on_lat_long = RestClient.get "https://api.openweathermap.org/data/2.5/weather?lat=" + latitude.to_s + "&lon=" + longitude.to_s + "&appid=7bcc10712fe906ecd190ba0bea2c910e"
			info = JSON.parse weather_based_on_lat_long
			return info['weather'][0]['main'] + ", " + info['weather'][0]['description']
		end
	end
	
	# TODO: take care of edge cases e.g 'São Paulo'
	def get_weather_for_city(location)
		endpoint = "https://api.openweathermap.org/data/2.5/weather?q=" + location + "&appid=7bcc10712fe906ecd190ba0bea2c910e"
		puts endpoint
		weather_based_on_city = RestClient.get endpoint
		info = JSON.parse weather_based_on_city
		puts info
		#checks if we got a 404 for a city that doesn't exist
		if !(info['cod'].present?)
		 	return "Couldnt find city"
		else 
			return info['weather'][0]['main'] + ", " + info['weather'][0]['description']
		end 
	end
end
