class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :teacher, foreign_key: true
      t.date :shopping_date
      t.date :date_entered

      t.timestamps
    end
  end
end
