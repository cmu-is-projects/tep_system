class CreateItemHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :item_histories do |t|
      t.references :item, foreign_key: true
      t.integer :units_per_pack
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
