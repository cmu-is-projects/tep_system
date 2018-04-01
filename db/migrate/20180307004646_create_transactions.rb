class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.references :teacher, foreign_key: true
      t.date :shopping_date
      t.date :date_entered, default: Date.current
      t.boolean :uploaded

      t.timestamps
    end
  end
end
