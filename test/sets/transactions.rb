module Contexts
  module Transactions
    # Context for transactions (assumes no prior contexts)

    def create_transactions
      @transaction_1 = FactoryBot.create(:transaction, user: @user, teacher: @teacher)
      @transaction_2  = FactoryBot.create(:transaction, user: @user, teacher: @teacher, 
        shopping_date: 5.days.ago.to_date)
      @transaction_3  = FactoryBot.create(:transaction, user: @user, teacher: @teacher,
        shopping_date: 5.days.ago.to_date, 
        date_entered: 3.days.ago.to_date, uploaded: true)
    end

    def destroy_transactions
      @transaction_1.delete
      @transaction_2.delete
      @transaction_3.delete
    end

  end
end