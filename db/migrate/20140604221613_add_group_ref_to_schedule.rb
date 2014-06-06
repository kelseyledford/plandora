class AddGroupRefToSchedule < ActiveRecord::Migration
  def change
    add_reference :schedules, :group, index: true
  end
end
