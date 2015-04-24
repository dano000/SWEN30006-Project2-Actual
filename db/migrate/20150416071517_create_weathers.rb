class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.datetime :time
      t.datetime :initial
      t.string   :source
      t.references :station, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
