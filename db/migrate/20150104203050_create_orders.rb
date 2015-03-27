class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :dostavka_id
      t.integer :payment_id
      t.boolean :status, default: 'new'
      t.string :mail
      t.string :tel
      t.string :address
      t.string :name
      t.text :detail

      t.timestamps
    end
  end
end
