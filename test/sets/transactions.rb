module Contexts
  module Transactions
    # Context for transactions (assumes no prior contexts)

    def create_transactions
      @transaction_1 = FactoryGirl.create(:transaction)
      @transaction_2  = FactoryGirl.create(:transaction, 
        shopping_date: Date.current - 2.days, uploaded: false)
      @transaction_3  = FactoryGirl.create(:transaction, 
        shopping_date: Date.current - 5.days, 
        date_entered: Date.current - 3.days, 
        uploaded: true)
    end

    def destroy_transactions
      @transaction_1.delete
      @transaction_2.delete
      @transaction_3.delete
    end

  end
end