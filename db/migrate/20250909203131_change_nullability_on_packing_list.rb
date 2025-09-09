class ChangeNullabilityOnPackingList < ActiveRecord::Migration[8.0]
  def change
    change_column_null :packing_lists, :name, false
    change_column_null :packing_lists, :destination, false
  end
end
