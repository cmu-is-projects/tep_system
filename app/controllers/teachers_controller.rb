class TeachersController < ApplicationController
  def index
  	@teachers = Teacher.all.paginate(page: params[:page]).per_page(20)
  end
end
