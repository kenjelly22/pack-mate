class PackingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @packing_lists = current_user.packing_lists
  end

  def show
    @packing_list = current_user.packing_lists.find(params[:id])
    @packing_list_items = @packing_list.items
    ##
    @items = Item.all_for_user(current_user)
    ##
  end

  def new
    @packing_list = current_user.packing_lists.new
  end

  def create
    @packing_list = current_user.packing_lists.new(packing_list_params)

    if @packing_list.save
      redirect_to packing_lists_path
    else
      render :new, status: :unprocessable_entity

    end
  end

  def destroy
    @packing_list = current_user.packing_lists.find(params[:id])
    @packing_list.destroy
    redirect_to packing_lists_path, notice: "Packing list deleted successfully."
  end

  private

  def packing_list_params
    params.require(:packing_list).permit(:name, :destination)
  end
end
