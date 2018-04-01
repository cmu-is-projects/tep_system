class TeacherController < ApplicationController
  def index
  	@teachers = Teacher.all
  end
end
