class OrdersController < ApplicationController
  def index
    @transactions = Transaction.enter_chronological.paginate(page: params[:page]).per_page(10)
  end

  def edit
  end

  def new
    @transaction = Transaction.new
  end

  def show
  end
  
  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      flash[:notice] = "Successfully added #{@transaction.name}."
      redirect_to @transaction
    else
      render action: 'new'
    end
  end

  def update
    if @transaction.update_attributes(transaction_params)
      flash[:notice] = "Successfully updated #{@transaction.name}."
      redirect_to @transaction
    else
      render action: 'edit'
    end
  end

  def destroy 
  end

end
