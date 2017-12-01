class RemoveColumnsFromStudents < ActiveRecord::Migration[5.1]
  def change
    remove_columns :students, :date, :comment, :user_id, :progress
  end
end
