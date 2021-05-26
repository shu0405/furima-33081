class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
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


  def edit
  end
  

  def show
      @comments = Comment.all
      @comment = Comment.new
  end

  def destroy
    if current_user.id == @item.user_id
       @item.destroy
       redirect_to root_path
    else 
       redirect_to root_path
    end
 end 

 def update
  if  @item.update(item_params)
   redirect_to item_path
  else
   render :edit
  end 
end
  
  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :state_id, :burden_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path if current_user.id != @item.user_id || @item.user_item.present?
  end

end
