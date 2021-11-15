class CreateJoinTableCalitatisRelatares < ActiveRecord::Migration[6.1]
  def change
    create_join_table :calitatis, :relatares do |t|
       t.index [:calitati_id, :relatare_id]
       t.index [:relatare_id, :calitati_id]
    end
  end
end
