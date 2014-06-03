class AddGroupRefToPoll < ActiveRecord::Migration
  def change
    add_reference :polls, :group, index: true
  end
end
