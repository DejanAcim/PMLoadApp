class RenameLoadsToWorkloads < ActiveRecord::Migration[5.1]
  def change
    rename_table :loads, :workloads
  end
end
