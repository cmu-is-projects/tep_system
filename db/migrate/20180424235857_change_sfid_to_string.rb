class ChangeSfidToString < ActiveRecord::Migration[5.1]
  def change
  	change_column :orders, :teacher_id, :string
  	change_column :order_items, :item_id, :string
  end
end
