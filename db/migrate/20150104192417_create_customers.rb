class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :tel
      t.string :login
      t.string :password_digest
      t.string :remember_token, index: true

      t.timestamps
    end
  end
end
