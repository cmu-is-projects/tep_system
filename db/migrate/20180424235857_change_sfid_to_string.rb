class ChangeSfidToString < ActiveRecord::Migration[5.1]
  def change
  	remove_column :orders, :teacher_id
  	add_column :orders, :teacher_id, :string
  	add_index :orders, :teacher_id

  	remove_column :order_items, :item_id
  	add_column :order_items, :item_id, :string
  	add_index :order_items, :item_id
  end
end
