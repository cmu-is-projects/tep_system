class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :salesforce_id
      t.references :school, foreign_key: true
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
