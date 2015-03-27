class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.integer :informer_id
      t.integer :link_position, default: 0
      t.string :keyword
      t.string :description
      t.text :content

      t.timestamps
    end
  end
end
