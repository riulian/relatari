class CreateTemes < ActiveRecord::Migration[6.1]
  def change
    create_table :temes do |t|
      t.string :denumire
      t.text :despre

      t.timestamps
    end
  end
end
