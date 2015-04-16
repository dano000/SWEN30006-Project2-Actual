class CreateRainfalls < ActiveRecord::Migration
  def change
    create_table :rainfalls do |t|
      t.float :current
      t.references :weather, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
