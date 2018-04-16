class HomeController < ApplicationController
  def index
    @recent_orders = Order.shop_chronological.last(10).to_a
  end
end