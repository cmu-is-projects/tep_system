class OrdersController < ApplicationController
  def index
    @orders = Order.enter_chronological.paginate(page: params[:page]).per_page(10)
  end

  def edit
  end

  def new
    @order = Order.new
  end

  def show
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = "Successfully added #{@order.name}."
      redirect_to @order
    else
      render action: 'new'
    end
  end

  def update
    if @order.update_attributes(order_params)
      flash[:notice] = "Successfully updated #{@order.name}."
      redirect_to @order
    else
      render action: 'edit'
    end
  end

  def destroy 
  end

end