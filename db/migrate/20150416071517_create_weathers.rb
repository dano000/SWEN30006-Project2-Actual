class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.datetime :time
      t.references :station, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
