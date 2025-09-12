class PackingListItemsController < ApplicationController
  def new
    @packing_list = PackingList.find(params[:packing_list_id])
    @items = Item.all_for_user(current_user)
  end

  def create
    packing_list = PackingList.find(params[:packing_list_id])

    name = params[:name].to_s.strip
    category = params[:category].to_s.strip

    if name.present? && category.present?
      new_item = Item.find_or_create_by(name: name.titleize, category: :category)
      packing_list.items << new_item unless packing_list.items.include?(new_item)
    end

    if params[:item_ids].present?
      items = Item.where(id: params[:item_ids])
      items.each do |item|
        packing_list.items << item unless packing_list.items.include?(item)
      end

      redirect_to packing_list, notice: "Items added successfully."
    else
      redirect_to new_packing_list_packing_list_item_path(packing_list), alert: "Items not added."
    end
  end

  def destroy
    @packing_list_item = PackingListItem.find(params[:id])
    packing_list = @packing_list_item.packing_list
    @packing_list_item.destroy

    redirect_to packing_list_path(packing_list), notice: "Item deleted!"
  end
end
