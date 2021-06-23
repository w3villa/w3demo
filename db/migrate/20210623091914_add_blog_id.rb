class AddBlogId < ActiveRecord::Migration[6.0]
  def change
  	remove_column :comments,:post_id,:integer
  	add_column :comments,:blog_id,:integer
  end
end
