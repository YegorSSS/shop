class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :keywords
      t.string :description
      t.string :anons
      t.text :content

      t.timestamps
    end
  end
end
