module Contexts
  module OrderItems
    # Context for transactions (assumes no prior contexts)

    def create_order_items
      @order1_items = FactoryBot.create(:transaction_item, transaction: @transaction_1, item: @item)
      @order2_items = FactoryBot.create(:transaction_item, transaction: @transaction_2, item: @item, quantity: 0)
      @order3_items = FactoryBot.create(:transaction_item, transaction: @transaction_3, item: @item, quantity: 10)
    end

    def destroy_order_items
      @order1_items.delete
      @order2_items.delete
      @order3_items.delete
    end

  end
end