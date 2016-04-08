class ItemsController < ApplicationController
  def index
  end

  def create
    @item = current_user.items.create(item_params)
    @user = User.find(params[:user_id])
    redirect_to user_path
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
