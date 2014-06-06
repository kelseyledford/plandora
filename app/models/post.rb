class Post < ActiveRecord::Base
	belongs_to :tag

	def self.save_post(tag_id, text, image_url, screen_name)
		post = Post.new
		post.tag_id = tag_id
		post.description = text
		post.profile_image_url = image_url
		post.user_name = screen_name
		post.save
	end

end
