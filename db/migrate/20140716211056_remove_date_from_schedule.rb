class RemoveDateFromSchedule < ActiveRecord::Migration
  def change
    remove_column :schedules, :date, :string
  end
end
