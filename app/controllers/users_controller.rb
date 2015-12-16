class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @items = @user.items.all

    @item = @user.items.new
  end
end
