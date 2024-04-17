class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:title, :item_price, :shipping_fee_responsibility_id, :comment, :item_category_id, :item_condition_id, :shipping_origin_id, :estimated_shipping_date_id).merge(user_id: current_user.id)
  end
end