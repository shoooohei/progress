class AddUsernameToConditions < ActiveRecord::Migration[5.1]
  def change
    add_column :conditions, :username, :string
  end
end
