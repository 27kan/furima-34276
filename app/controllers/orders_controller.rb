class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user

  def index # indexアクションでインスタンスを渡す
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :area_id, :city, :house_number, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def correct_user # 出品者を自身の商品購入画面へ遷移させない
    @user = Item.find(params[:item_id])
    if @user.user_id == current_user.id
      redirect_to root_path
    end
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
