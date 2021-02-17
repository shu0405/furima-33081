class ItemsController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :birthday, :first_name, :surname_name, :katakana_first_name, :katakana_surname_name)
  end
end
