class CreateCalitatis < ActiveRecord::Migration[6.1]
  def change
    create_table :calitatis do |t|
      t.string :denumire

      t.timestamps
    end
  end
end
