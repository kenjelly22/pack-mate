class PackingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @packing_lists = current_user.packing_lists
  end

  def show
    @packing_list = @packing_lists.find(params[:id])
  end
end
