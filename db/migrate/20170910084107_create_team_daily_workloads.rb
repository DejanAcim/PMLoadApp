class CreateTeamDailyWorkloads < ActiveRecord::Migration[5.1]
  def change
    create_table :team_daily_workloads do |t|
      t.float :score
      t.date :day

      t.timestamps
    end
  end
end
