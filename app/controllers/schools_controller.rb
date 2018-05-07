class SchoolsController < ApplicationController
	# A callback to set up an @school object to work with 
  before_action :set_school, only: [:show]
  authorize_resource

  def index
  	@schools = School.all.paginate(page: params[:page]).per_page(20)
  end

  def show 
  	@teachers = @school.teachers.alphabetical.paginate(page: params[:page]).per_page(10)
  end 

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_school
    @school = School.find(params[:id])
  end

end
