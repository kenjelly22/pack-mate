class ChangeNullabilityOnPackingListItems < ActiveRecord::Migration[8.0]
  def change
    change_column_null :packing_list_items, :quantity, false
    change_column_null :packing_list_items, :status, false
  end
end
