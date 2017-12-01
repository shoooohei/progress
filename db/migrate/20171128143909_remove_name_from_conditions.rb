class RemoveNameFromConditions < ActiveRecord::Migration[5.1]
  def change
    remove_column :conditions, :name
  end
end
