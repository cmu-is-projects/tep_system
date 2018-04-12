class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all.uploaded.enter_chronological.paginate(page: params[:page]).per_page(20)
  end

  def edit
  end

  def new
    @order = Order.new
    @items = Item.active.all
    order_item = @order.order_items.build
  end

  def show
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      # save_order_items
      flash[:notice] = "Successfully added #{@order.id}."
      redirect_to order_path(@order)
    else
      render action: 'new'
    end
  end

  def update
    if @order.update_attributes(order_params)
      flash[:notice] = "Successfully updated #{@order.id}."
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

#did I write this correctly
#SYNC TO SALESFORCE
  def upload
    @orders = Order.all.not_uploaded.enter_chronological.paginate(page: params[:page]).per_page(20)
    Order.not_uploaded.update_all(:uploaded => true)
    flash[:notice] = "Successfully uploaded data to Salesforce."
    
    render action: 'sync'
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
      # ois = params[:order][:order_items_attributes]
      # unless ois.nil?
      #   ois.each do |oi_hash|
      #     OrderItem.create(oi_hash)
      #   end 
      # end 
    # end 

end
