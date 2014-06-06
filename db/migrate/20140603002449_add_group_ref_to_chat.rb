class AddGroupRefToChat < ActiveRecord::Migration
  def change
    add_reference :chats, :group, index: true
  end
end
