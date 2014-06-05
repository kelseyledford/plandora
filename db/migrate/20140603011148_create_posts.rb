class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :description
      t.string :profile_image_url
      t.string :user_name
      t.string :tag_id

      t.timestamps
    end
  end
end
