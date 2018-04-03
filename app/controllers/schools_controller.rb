class SchoolsController < ApplicationController
  def index
  	@schools = School.all.paginate(page: params[:page]).per_page(20)
  end
end
