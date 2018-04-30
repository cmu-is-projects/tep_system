class AddSortToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :sort, :integer
  end
end
