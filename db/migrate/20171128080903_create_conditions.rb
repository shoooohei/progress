class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.string :name
      t.integer :progress
      t.timestamp :date
      t.text :comment
      t.integer :user_id

      t.timestamps
    end
  end
end
