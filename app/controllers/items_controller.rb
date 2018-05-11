class ItemsController < ApplicationController
	authorize_resource
	def index 
		@items = Item.all.paginate(page: params[:page]).per_page(20)
	end 

	def new 
		@item = Item.new
	end 

	def create
		@item = Item.new(item_params)
		if @item.save
			flash[:notice] = "Successfully added #{@item.name}"
			redirect_to items_path
		else 
			render action: 'new'
		end 
	end 

	def update 
		@item = Item.find params[:id]

		respond_to do |format|
		  if @item.update_attributes(item_params)
				format.json { respond_with_bip(@item) }
		  else
				format.json { respond_with_bip(@item) }
		  end
		end
	end 

	def destroy
		@item = Item.find(params[:id])
		if @item.destroy
	      flash[:notice] = "Successfully removed #{@item.name}."
	      redirect_to items_path
	    else
	      render action: 'index'
	    end
	end 

	private
	def item_params
		params.require(:item).permit(:name, :max_packs, :qty_per_unit, :active)
	end 

end 