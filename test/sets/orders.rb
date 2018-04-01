module Contexts
  module Orders
    # Context for Orders (assumes no prior contexts)

    def create_orders
      @order_1 = FactoryBot.create(:order, user: @user, teacher: @teacher)
      @order_2  = FactoryBot.create(:order, user: @user, teacher: @teacher, 
        shopping_date: 5.days.ago.to_date)
      @order_3  = FactoryBot.create(:order, user: @user, teacher: @teacher,
        shopping_date: 5.days.ago.to_date, 
        date_entered: 3.days.ago.to_date, uploaded: true)
    end

    def destroy_orders
      @order_1.delete
      @order_2.delete
      @order_3.delete
    end

  end
end