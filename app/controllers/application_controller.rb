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
		user_ip_addr = request.env['REMOTE_ADDR']
		return "Narnia"
	end

	def get_default_weather
		return "Cloudy with a chance of Deux"
	end
end
