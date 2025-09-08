class CreatePackingListItems < ActiveRecord::Migration[8.0]
  def change
    create_table :packing_list_items do |t|
      t.integer :quantity, default: 0
      t.string :status, default: "not_packed"
      t.references :packing_list, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
