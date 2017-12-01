class AddIndexToStudentsName < ActiveRecord::Migration[5.1]
  def change
    add_index :students, :name, unique: true
  end
end
