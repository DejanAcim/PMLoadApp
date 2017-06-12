class AddUserToLoadsTable < ActiveRecord::Migration[5.1]
  def change
  	add_reference :loads, :user, foreign_key: true
  end
end
