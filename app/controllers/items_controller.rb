class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create,:edit,:update ]
  before_action :set_item

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
       return redirect_to root_path
    else
       render "new"
    end
  end
  
  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if  @item.valid?
        @item.update(item_params)
        redirect_to item_path
    else
      render :edit
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :potage_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end