class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all.enter_chronological.paginate(page: params[:page]).per_page(20)
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
    byebug
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = "Successfully added #{@order.id}."
      redirect_to @order
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
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:user_id, :teacher_id, :date_entered, :shopping_date, :uploaded, order_item: [:item_id, :quantity])
    end

end
