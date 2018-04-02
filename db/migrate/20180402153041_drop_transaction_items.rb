class DropTransactionItems < ActiveRecord::Migration[5.1]
  def change
    drop_table :transaction_items
  end
end
