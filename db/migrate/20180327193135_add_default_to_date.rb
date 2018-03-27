class AddDefaultToDate < ActiveRecord::Migration[5.1]
  def change
    change_column_default :transactions, :date_entered, Date.current
  end
end
