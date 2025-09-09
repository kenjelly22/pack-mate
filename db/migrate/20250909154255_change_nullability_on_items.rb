class ChangeNullabilityOnItems < ActiveRecord::Migration[8.0]
  def change
    change_column_null :items, :user_id, true
    change_column_null :items, :name, false
    change_column_null :items, :category, false
  end
end
