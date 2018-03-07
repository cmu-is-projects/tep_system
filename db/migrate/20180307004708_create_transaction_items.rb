class CreateTransactionItems < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_items do |t|
      t.references :transaction, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
