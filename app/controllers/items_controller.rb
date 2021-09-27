class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.all
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit()
  end

end
