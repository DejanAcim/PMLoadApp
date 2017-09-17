class AddConfirmedToWorkloads < ActiveRecord::Migration[5.1]
  def change
    add_column :workloads, :confirmed, :boolean, default: false
  end
end
