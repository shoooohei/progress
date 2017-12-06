class RemoveCommentFromConditions < ActiveRecord::Migration[5.1]
  def change
    remove_column :conditions, :comment
    add_column :conditions, :comment, :text
  end
end
