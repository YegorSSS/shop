class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :name
      t.string :articul
      t.string :keyword
      t.string :description
      t.string :img, default: 'no_image.jpg'
      t.integer :category_id
      t.text :anons
      t.text :content
      t.boolean :presence, default: true
      t.boolean :visible, default: true
      t.boolean :hits, default: false
      t.boolean :fresh, default: false
      t.boolean :sale, default: false
      t.integer :price
      t.string :img_slide
      t.integer :views, default: 0

      t.timestamps
    end
  end
end
