class PackingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @packing_lists = current_user.packing_lists
  end

  def show
    @packing_list = current_user.packing_lists.find(params[:id])
    @packing_list_items = @packing_list.items
  end

  def new
    @packing_list = current_user.packing_lists.new
  end

  def create
    @packing_list = current_user.packing_lists.new(packing_list_params)

    if @packing_list.save
      redirect_to packing_lists_path(@packing_lists)
    else
      render :new, status: :unprocessable_entity

    end
  end

  private

  def packing_list_params
    params.require(:packing_list).permit(:name, :destination)
  end
end
