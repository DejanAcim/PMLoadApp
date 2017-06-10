class CreateLoads < ActiveRecord::Migration[5.1]
  def change
    create_table :loads do |t|
      t.integer :score
      t.datetime :date

      t.timestamps
    end
  end
end
