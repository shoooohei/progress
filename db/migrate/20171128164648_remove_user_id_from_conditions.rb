class RemoveUserIdFromConditions < ActiveRecord::Migration[5.1]
  def change
    remove_column :conditions, :user_id
  end
end
