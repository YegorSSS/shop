class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :keyword
      t.string :description
      t.string :content
      t.integer :position, default: 0

      t.timestamps
    end
  end
end
