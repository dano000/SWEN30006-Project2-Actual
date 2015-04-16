class CreateWinddirs < ActiveRecord::Migration
  def change
    create_table :winddirs do |t|
      t.string :current
      t.references :weather, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
