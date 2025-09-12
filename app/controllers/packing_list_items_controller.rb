class PackingListItemsController < ApplicationController
  before_action :authenticate_user!
  def new
    @packing_list = PackingList.find(params[:packing_list_id])
    @items = Item.all_for_user(current_user)
  end

  def create
    packing_list = PackingList.find(params[:packing_list_id])

    if params[:name].present? && params[:category].present?
      new_item = Item.find_or_create_by(name: params[:name].titleize.strip, category: params[:category])
      packing_list.items << new_item unless packing_list.items.include?(new_item)
    end

    if params[:item_ids].present?
      items = Item.where(id: params[:item_ids])
      items.each do |item|
        packing_list.items << item unless packing_list.items.include?(item)
      end

      redirect_to packing_list, notice: "Items added successfully."
    end
  end
end
