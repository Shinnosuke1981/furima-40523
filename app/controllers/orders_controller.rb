class OrdersController < ApplicationController

  def new
    @order_address = OrderAddress.new
  end

end
