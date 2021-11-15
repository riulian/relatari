class CreateRelatares < ActiveRecord::Migration[6.1]
  def change
    create_table :relatares do |t|
      t.text :textro
      t.text :texten
      t.integer :user_id

      t.timestamps
    end
  end
end
