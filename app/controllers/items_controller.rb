class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
      @item = Item.new(item_params)
    end
  end

  def edit
    @item = Item.find(params[:id])
    return if @item.user_id == current_user.id

    redirect_to root_path
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to { @item.id }
    else
      @user = @item
      render :edit, status: :unprocessable_entity

    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id,
                                 :delivery_fee_id, :shipping_address_id, :shipping_days_id, :amount, :image).merge(user_id: current_user.id)
  end
end
