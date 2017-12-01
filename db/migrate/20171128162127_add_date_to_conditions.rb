class AddDateToConditions < ActiveRecord::Migration[5.1]
  def change
    add_column :conditions, :date, :date
  end
end
