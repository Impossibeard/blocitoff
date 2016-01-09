class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @items = @user.items

    @item = Item.new
  end
end
