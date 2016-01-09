class ItemsController < ApplicationController
  def create

    @user = User.find(params[:user_id])

    @item = @user.items.new

    @item.name = params[:item][:name]

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to @user
    else
      flash[:error] = "Thee was an error saving the item. Please try again."
      redirect_to @user
    end
  end

  def destroy
    @user = User.find(params[:user_id])
#    @item = Item.find(params[:id])
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" was completed successfully!"
    else
      flash[:error] = "There was an error completing the task."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def toggle
    #load item
    #mark as complete/incomplete, save
    #redirect

    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:item_id])

    @item.completed = !@item.completed

    if @item.save
      flash[:notice] = "\"#{@item.name}\" was updated!"
    else
      flash[:error] = "There was an error updating the task."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
