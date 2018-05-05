class TeachersController < ApplicationController
	# A callback to set up an @teacher object to work with 
  before_action :set_teacher, only: [:show]
  authorize_resource
  def index
  	@teachers = Teacher.all.paginate(page: params[:page]).per_page(20)
  end

  def show
  	@recent_orders = @teacher.orders.shop_chronological.last(10).to_a
  end 

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end
