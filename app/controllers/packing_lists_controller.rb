class PackingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @packing_lists = current_user.packing_lists
  end

  def show
    @packing_list = current_user.packing_lists.find_by(params[:id])
    @packing_list_items = @packing_list.items
  end
end
