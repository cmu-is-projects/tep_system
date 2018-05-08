class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.role? :admin
        can :manage, :all

    elsif user.role? :volunteer
        can :read, Order
        can :create, Order do |order|
            order.id == user.order_id
        end
        can :create, OrderItem do |order_item|
            order_item.id == user.order_item
        end
    end
  end
end
