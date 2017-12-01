class RemoveDateFromConditions < ActiveRecord::Migration[5.1]
  def change
    remove_column :conditions, :date
  end
end
