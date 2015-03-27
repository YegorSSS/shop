class CreateGoodparams < ActiveRecord::Migration
  def change
    create_table :goodparams do |t|
      t.string :value
      t.integer :characteristic_id
      t.integer :good_id

      t.timestamps
    end
  end
end
