class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    
  end
  def create
    @item = Item.find(params[:item_id])
    @order = Purchase.new(order_params)

    if @order.valid?
       @order.save

       return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  #formオブジェクト記述後、修正
  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :city2, :bldg, :phone_num)
    .merge(item_id: params[:item_id], user_id: current_user.id)
  end
end