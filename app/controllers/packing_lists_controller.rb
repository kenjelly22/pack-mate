class PackingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @packing_lists = current_user.packing_lists
  end

  def show
    @packing_list = current_user.packing_lists.find(params[:id])
    @packing_list_items = @packing_list.packing_list_items.includes(:item)
    @items = Item.all_for_user(current_user)
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

  def update
    @packing_list = current_user.packing_lists.find(params[:id])

  if params[:packed_item_ids].present?
    @packing_list.packing_list_items.each do |pli|
      new_status = params[:packed_item_ids].include?(pli.id.to_s) ? "packed" : "not_packed"
      pli.update(status: new_status)
    end
  else
    @packing_list.packing_list_items.update_all(status: "not_packed")
  end

  redirect_to packing_list_path(@packing_list), notice: "Packing list updated!"
  end

  private

  def packing_list_params
    params.require(:packing_list).permit(:name, :destination)
  end
end
