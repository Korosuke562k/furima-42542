class OrdersController < ApplicationController
  before_action :login
  before_action :authenticate_user!, only: [:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    set_items
    @buy_address = BuyAddress.new
  end

  def new
    @buy_address =BuyAddress.new
  end

def create
  set_items
  @buy_address = BuyAddress.new(buy_params)
  if @buy_address.valid?
    pay_item
    @buy_address.save
    @item.sold!
    redirect_to root_path
  else
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    render :index, status: :unprocessable_entity
  end
end


  private
    def buy_params
      params.require(:buy_address).permit(:post_code, :shipping_address_id, :city, :street, 
                    :building_name, :telephone)
                    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.amount,
        card: buy_params[:token],
        currency: 'jpy' 
      )
    end

    def set_items
      @item = Item.find(params[:item_id])
    end

    def login
      @item = Item.find(params[:item_id])
      if @item.sold? || @item.user_id == current_user.id
        redirect_to root_path
      end
    end
  end

end
