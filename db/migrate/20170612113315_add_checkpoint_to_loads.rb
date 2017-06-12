class AddCheckpointToLoads < ActiveRecord::Migration[5.1]
  def change
    add_column :loads, :checkpoint, :integer
  end
end
