class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id]) 
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id]) 
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :street_number, :building_name, :phone_number,:order_id).merge(user_id: current_user.id)
  end
end
