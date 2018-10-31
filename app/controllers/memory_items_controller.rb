class MemoryItemsController < ApplicationController
	before_action :set_memory_list

	def create
		if (params[:memory_item][:location].empty?)
			params[:memory_item][:location] = "Brasilia"
		end
		if (params[:memory_item][:weather].empty?)
			params[:memory_item][:weather] = "Cloudy with chance of Hamburgers"
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
