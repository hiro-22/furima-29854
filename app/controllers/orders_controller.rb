class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index  
    @order = Order.new 
    if current_user.id == @item.user_id || @item.order != nil
    redirect_to root_path 
    end
  end

  def create
    @order = Purchase.new(order_params)

    if @order.valid?
       pay_item
       @order.save
       return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :city2, :bldg, :phone_num)
    .merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end