class AddTemeIdToRelatares < ActiveRecord::Migration[6.1]
  def change
    add_column :relatares, :teme_id, :integer
  end
end
