class AddGroupRefToDirection < ActiveRecord::Migration
  def change
    add_reference :directions, :group, index: true
  end
end
