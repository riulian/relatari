class AddUserIdToTemes < ActiveRecord::Migration[6.1]
  def change
    add_column :temes, :user_id, :integer
  end
end
