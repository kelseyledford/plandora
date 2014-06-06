class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :activity
      t.references :schedule, index: true

      t.timestamps
    end
  end
end
