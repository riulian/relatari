class AddActualToTemes < ActiveRecord::Migration[6.1]
  def change
    add_column :temes, :actual, :integer
  end
end
