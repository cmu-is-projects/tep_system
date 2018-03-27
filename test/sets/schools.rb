module Contexts
  module Schools
    # Context for schools (assumes no prior contexts)

    def create_schools
      @school = FactoryBot.create(:school)
    end

    def destroy_transactions
      @school.delete
    end

  end
end