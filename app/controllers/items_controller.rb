class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]
  before_action :set_item, only: [:show,:edit,:update,:destroy]
  # before_action :current_user, only: [:edit,:update,:destroy]

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
    if current_user != @item.user || @item.order != nil
    redirect_to root_path 
    end
  end

  def update
    if  @item.valid?
        @item.update(item_params)
        redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
       @item.destroy
       redirect_to root_path 
    else
     render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :potage_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end