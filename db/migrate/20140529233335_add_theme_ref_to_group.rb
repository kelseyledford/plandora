class AddThemeRefToGroup < ActiveRecord::Migration
  def change
    add_reference :groups, :theme, index: true
  end
end
