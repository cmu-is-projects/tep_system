module Contexts
  module Items
    # Context for items (assumes no prior contexts)

    def create_items
      @pencils = FactoryBot.create(:item)
      @binders = FactoryBot.create(:item, name: "Binders")
      @notebooks = FactoryBot.create(:item, name: "Notebooks", active: false)
      @erasers = FactoryBot.create(:item, name: "Erasers")
      @staplers = FactoryBot.create(:item, name: "Staplers", active: false)
    end

    def destroy_items
      @pencils.delete
      @binders.delete
      @notebooks.delete
      @erasers.delete
      @staplers.delete
    end

  end
end