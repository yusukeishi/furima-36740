class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.all
    #@item = Item.order('created_at DESC')
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
    params.require(:item).permit(:name, :description, :status_id, :category_id, :delivery_charge_id, :delivery_day_id,
                                 :prefecture_id, :price, :image).merge(user_id: current_user.id)
  end
end
