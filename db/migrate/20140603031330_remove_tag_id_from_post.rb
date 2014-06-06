class RemoveTagIdFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :tag_id, :string
  end
end
