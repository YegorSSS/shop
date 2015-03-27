class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :keyword
      t.string :description
      t.text :content
      t.string :img
      t.integer :parent_id, default: 0


      t.timestamps
    end
  end
end
