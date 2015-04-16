class CreateWindspeeds < ActiveRecord::Migration
  def change
    create_table :windspeeds do |t|
      t.float :current
      t.references :weather, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
