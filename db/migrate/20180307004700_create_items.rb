class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :max_packs
      t.integer :qty_per_unit
      t.boolean :active, default: true
      t.integer :sort

      t.timestamps
    end
  end
end
