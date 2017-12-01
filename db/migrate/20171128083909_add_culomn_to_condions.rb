class AddCulomnToCondions < ActiveRecord::Migration[5.1]
  def change
    add_column :conditions, :student_id, :integer
  end
end
