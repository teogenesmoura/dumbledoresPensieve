class MemoryItemsController < ApplicationController
	before_action :set_memory_list

	def create
		location = params[:memory_item][:location]
		weather = params[:memory_item][:weather]
		if (location.empty?) and (weather.empty?)
			params[:memory_item][:location] = get_city_for_ip
			params[:memory_item][:weather] = get_weather_for_latitude_longitude
		end
		if !(location.empty?) and (weather.empty?)
			params[:memory_item][:weather] = get_weather_for_city(location)
		end
		@memory_item = @memory_list.memory_items.create(memory_item_params)
		redirect_to @memory_list
	end

	def destroy
		@memory_item = @memory_list.memory_items.find(params[:id])
		if @memory_item.destroy
			flash[:success] = "Memory List item was deleted"
		else
			flash[:error] = "Memory List item could not be deleted"
		end
		redirect_to @memory_list
	end

	private

	def set_memory_list
		@memory_list = MemoryList.find(params[:memory_list_id])
	end

	def memory_item_params
		params[:memory_item].permit(:content, :location, :weather, :date_recorded)
	end
end
