class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.string :name
      t.integer :progress, default: 0
      t.timestamp :date
      t.text :comment, default: 'Account created'
      t.integer :user_id

      t.timestamps
    end
  end
end
