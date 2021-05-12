class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.includes(:user).order("created_at DESC") 
    # user_id取得のため、includesでuserモデルから情報を取得する。
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

  private
  def item_params
    params.require(:item).permit(:image,:name,:info,:category_id,:item_status_id,:shipping_id,:area_id,:schedule_id,:price).merge(user_id: current_user.id)
  end

end
