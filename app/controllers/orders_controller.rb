class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    gon_public_key
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      gon_public_key
      render :index, status: :unprocessable_entity
    end
  end


  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :street_address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def gon_public_key
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end



end
