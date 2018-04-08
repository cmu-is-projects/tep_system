class OrderItemsController < ApplicationController
	before_action :set_order_item, only: [:destroy]
	
	def new 
		@order_item = OrderItem.new
		@order_item.order_id = params[:order_id] unless params[:order_id].nil?
	end 

	def create 
		@order_item = OrderItem.new(order_item_params)
		if @order_item.save
			redirect_to orders_path
		else 
			render :action => 'new'
		end 
	end 

	def destroy
		@order_item.destroy
		redirect_to orders_path
	end 

	private 
	def set_order_item
		@order_item = OrderItem.find(params[:id])
	end 

	def order_item_params
		params.require(:order_item).permit(:order_id, :item_id, :quantity)
	end 
end 