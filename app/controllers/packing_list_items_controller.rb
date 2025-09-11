class PackingListItemsController < ApplicationController
  def new
    @packing_list = PackingList.find(params[:packing_list_id])
    @items = Item.where(user_id: [ nil, current_user.id ])
  end

  def create
  end
end
