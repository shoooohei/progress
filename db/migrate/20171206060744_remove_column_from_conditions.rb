class RemoveColumnFromConditions < ActiveRecord::Migration[5.1]
  def change
    remove_column :conditions, :date
    add_column :conditions, :date, :date
  end
end
