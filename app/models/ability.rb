class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.role? :admin
        can :manage, :all

    elsif user.role? :volunteer
        can :create, Order do |order|
            order.id == user.order_id
        end
        can :create, OrderItem do |order_item|
            order_item.id == user.order_item
        end
    elsif user.role? :manager
        can :create, Order
        can :update, Item 
        can :read, School
        can :read, OrderItems
        can :read, Teachers
    else
        can :read, Home
    end
  end
end
