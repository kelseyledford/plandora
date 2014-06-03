class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :topic
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :option5

      t.timestamps
    end
  end
end
