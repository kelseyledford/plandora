class RemoveTypeFromTheme < ActiveRecord::Migration
  def change
    remove_column :themes, :type, :string
  end
end
