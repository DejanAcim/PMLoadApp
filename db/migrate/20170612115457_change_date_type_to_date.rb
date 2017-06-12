class ChangeDateTypeToDate < ActiveRecord::Migration[5.1]
  def change
  	change_column :loads, :date, :date
  end
end
