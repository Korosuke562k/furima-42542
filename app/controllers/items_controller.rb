class ItemsController < ApplicationController
  before_action :set_items, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       @item.not_sold!
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
      @item = Item.new(item_params)
    end
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
    if @item.user == current_user && @item.sold?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to { @item.id }
    else
      @user = @item
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
    @item.destroy
    redirect_to root_path
  end

  private
    def item_params
      params.require(:item).permit(:name, :text, :category_id, :status_id,
      :delivery_fee_id, :shipping_address_id, :shipping_days_id, :amount, :image, :status)
      .merge(user_id: current_user.id)
    end


    def set_items
      @item = Item.find(params[:id])
    end

end
