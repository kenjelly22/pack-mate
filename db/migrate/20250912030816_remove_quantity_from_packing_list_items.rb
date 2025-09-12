class RemoveQuantityFromPackingListItems < ActiveRecord::Migration[8.0]
  def change
    remove_column :packing_list_items, :quantity
  end
end
