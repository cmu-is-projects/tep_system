module Contexts
  module Teachers
    # Context for teachers (assumes no prior contexts)
    def create_teachers
      @teacher = FactoryBot.create(:teacher, school: @school)
    end

    def destroy_teachers
      @teacher.delete
    end

  end
end