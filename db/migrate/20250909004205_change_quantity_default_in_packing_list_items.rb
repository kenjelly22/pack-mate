class ChangeQuantityDefaultInPackingListItems < ActiveRecord::Migration[8.0]
  def change
    change_column_default :packing_list_items, :quantity, from: 0, to: 1
  end
end
