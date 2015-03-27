class CreateGoodsinorders < ActiveRecord::Migration
  def change
    create_table :goodsinorders do |t|
      t.integer :order_id
      t.integer :good_id
      t.integer :quantity

      t.timestamps
    end
  end
end
