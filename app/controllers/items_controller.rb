class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :item_edit, only: [:edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
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
  end


  def edit
  end  

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

    def destroy
     if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
     else
      redirect_to root_path
     end
    end

  private

  def item_params
    params.require(:item).permit(:name, :description, :status_id, :category_id, :delivery_charge_id, :delivery_day_id,
                                 :prefecture_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


  def item_edit
    redirect_to root_path unless current_user == @item.user
  end
end

