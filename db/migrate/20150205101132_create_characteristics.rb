class CreateCharacteristics < ActiveRecord::Migration
  def change
    create_table :characteristics do |t|
      t.string :name
      t.integer :position, default: 0

      t.timestamps
    end
  end
end
