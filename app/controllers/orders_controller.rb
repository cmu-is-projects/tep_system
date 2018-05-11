class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  authorize_resource
  def index
    @orders = Order.all.enter_chronological.paginate(page: params[:page]).per_page(5)
    respond_to do |format|
      format.html
      format.csv do #{  filename: "orders-#{Date.today}.csv" }
        headers['Content-Disposition'] = "attachment; filename=\"orders-#{Date.today}.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
    
  end

  def edit
    @order_items = @order.order_items
  end

  def new # checkout page
    @order = Order.new
    @items = Item.order(:sort).get_items_with_unique_names
    order_item = @order.order_items.build
  end

  def show
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      # save_order_items
      flash[:notice] = "Successfully added POS Transaction for #{@order.teacher.name}."
      redirect_to :action => 'new'
    else
      flash[:error] = "Error in checking out. Fill out all fields, and check that shopping date is on or before today."
      # @items = @order.order_items.map{|oi| oi.item}
      # order_item = @order.order_items.build
      # render action: 'new'
      redirect_to :action => 'new'
    end
  end

  def update
    if @order.update_attributes(order_params)
      flash[:notice] = "Successfully updated order for #{@order.teacher.name}."
      redirect_to @order
    else
      render action: 'edit'
    end
  end

  def destroy 
    if @order.destroy
      redirect_to orders_url, notice: "Successfully removed Order #{@order.id}."
    else
      render action: 'show'
    end
  end

  def destroy_all
    @orders = Order.uploaded.all
    if @orders.destroy_all
      redirect_to orders_url, notice: "Successfully deleted uploaded orders from DataCat."
    else
      redirect_to orders_url, notice: "System error: unable to destroy uploaded orders."
    end
  end

  def upload
    Order.add_to_pos_transactions
    Order.set_all_to_uploaded
    flash[:notice] = "Added POS Transactions. Double check Salesforce for updates within 2 minutes."
    redirect_to sync_path
  end

  def sync
    @orders = Order.all.not_uploaded.enter_chronological.paginate(page: params[:page]).per_page(20)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:user_id, :teacher_id, :date_entered, :shopping_date, :uploaded, order_items_attributes: [:item_id, :quantity])
    end

    # def save_order_item
    #   # loop through order items params and save each one 
    #   ois = params[:order][:order_items_attributes]
    #   unless ois.nil?
    #     ois.each do |oi_hash|
    #       OrderItem.create(oi_hash)
    #     end 
    #   end 
    # end 

end
