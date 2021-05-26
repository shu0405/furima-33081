class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :contributor_confirmation

  
  def index
    @address_form = AddressForm.new
  end

  def create
    @address_form = AddressForm.new(address_params)
    if @address_form.valid?
     pay_item
      @address_form.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.require(:address_form).permit(:postal_code, :area_id, :municipality, :address_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: address_params[:token],   
        currency: 'jpy'               
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    redirect_to root_path if current_user.id == @item.user_id || @item.user_item.present?
  end

end
