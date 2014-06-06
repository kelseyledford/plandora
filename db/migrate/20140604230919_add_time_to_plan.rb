class AddTimeToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :activity_time, :time
  end
end
