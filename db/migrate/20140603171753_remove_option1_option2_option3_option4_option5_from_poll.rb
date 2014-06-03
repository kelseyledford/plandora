class RemoveOption1Option2Option3Option4Option5FromPoll < ActiveRecord::Migration
  def change
    remove_column :polls, :option1, :string
    remove_column :polls, :option2, :string
    remove_column :polls, :option3, :string
    remove_column :polls, :option4, :string
    remove_column :polls, :option5, :string
  end
end
