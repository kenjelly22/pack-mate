class PackingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @packing_lists = PackingList.all
  end

  def show
    @packing_list = PackingList.find(params[:id])
  end
end
