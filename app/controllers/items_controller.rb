class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  
  def index
    @items = Item.all.order("created_at DESC") 
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # before_actionでset済み
  end

  def edit
    # before_actionでset済み
  end

  def update
    # before_actionでset済み
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    # before_actionでset済み
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image,:name,:info,:category_id,:item_status_id,:shipping_id,:area_id,:schedule_id,:price).merge(user_id: current_user.id)
  end

  def correct_user
    @user = Item.find(params[:id])
    unless @user.user_id == current_user.id
      redirect_to root_path
    end
  end

  def set_params
    @item = Item.find(params[:id])
  end
end
