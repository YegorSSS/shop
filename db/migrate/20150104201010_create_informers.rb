class CreateInformers < ActiveRecord::Migration
  def change
    create_table :informers do |t|
      t.string :name
      t.integer :informer_position, default: 0

      t.timestamps
    end
  end
end
