module Contexts
  module TransactionItems
    # Context for transactions (assumes no prior contexts)

    def create_transaction_items
      @transaction_items_1 = FactoryGirl.create(:transaction_item)
      @transaction_items_2  = FactoryGirl.create(:transaction, 
        shopping_date: Date.current - 2.days, uploaded: false)
      @transaction_items_3  = FactoryGirl.create(:transaction, 
        shopping_date: Date.current - 5.days, 
        date_entered: Date.current - 3.days, 
        uploaded: true)
    end

    def destroy_transaction_items
      @transaction_items_1.delete
      @transaction_items_2.delete
      @transaction_items_3.delete
    end

  end
end