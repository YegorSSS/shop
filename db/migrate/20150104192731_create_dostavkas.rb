class CreateDostavkas < ActiveRecord::Migration
  def change
    create_table :dostavkas do |t|
      t.string :name

      t.timestamps
    end
  end
end
