class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :max_packs
      t.boolean :active

      t.timestamps
    end
  end
end
