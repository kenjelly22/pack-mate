class RemoveStartDateColumnFromPackingList < ActiveRecord::Migration[8.0]
  def change
    remove_column :packing_lists, :start_date, :date
  end
end
