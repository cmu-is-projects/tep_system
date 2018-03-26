module Contexts
  module TransactionItems
    # Context for transactions (assumes no prior contexts)

    def create_transaction_items
      @transaction1_items = FactoryGirl.create(:transaction_item, transaction: @transaction_1, item: @item)
      @transaction2_items = FactoryGirl.create(:transaction_item, transaction: @transaction_2, item: @item, quantity: 0)
      @transaction3_items = FactoryGirl.create(:transaction_item, transaction: @transaction_3, item: @item, quantity: 10)
    end

    def destroy_transaction_items
      @transaction1_items.delete
      @transaction2_items.delete
      @transaction3_items.delete
    end

  end
end