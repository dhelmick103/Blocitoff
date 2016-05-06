class ItemsController < ApplicationController

  # respond_to do |format|
  #   format.html
  #   format.js
  # end

  def index
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      flash[:notice] = "Item saved"
    else
      flash[:error] = "Something went wrong. Please try again"
    end
    redirect_to current_user
  end

  def destroy
    item = Item.find(params[:id])

    if item.destroy
      flash[:notice] = "Item saved"
    else
      flash[:error] = "Something went wrong. Please try again"
    end
    redirect_to current_user
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
