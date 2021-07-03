class LikesController < ApplicationController

  before_action :set_params

  def like
    like = current_user.likes.new(item_id: @item.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(item_id: @item.id)
    like.destroy
  end

  private
  def item_params
    require.permit
  end

  def set_params
    @item = Item.find(params[:item_id])
    @id_name = "#like-button-#{@item.id}"
  end

end
