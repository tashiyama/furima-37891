class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :item_find,          only: [:show, :edit, :update, :destroy]
  before_action :not_current_user,   only: [:edit, :update]

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
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy 
    if @item.destroy
      redirect_to root_path
    end   
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :item_name, :item_info, :price, :category_id, :sales_status_id, :prefecture_id, :shipping_fee_id, :scheduled_delivery_id
    ).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def not_current_user
    if @item.user_id != current_user.id || !@item.order.nil?
      redirect_to root_path
    end
  end
end
