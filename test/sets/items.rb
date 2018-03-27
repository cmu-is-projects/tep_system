module Contexts
  module Items
    # Context for items (assumes no prior contexts)

    def create_items
      @item = FactoryBot.create(:item)
    end

    def destroy_items
      @item.delete
    end

  end
end