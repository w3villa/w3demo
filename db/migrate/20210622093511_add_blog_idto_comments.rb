class AddBlogIdtoComments < ActiveRecord::Migration[6.0]
  def change
  	add_column :comments, :blog_id, :integer
  	add_column :comments, :body, :text
  	add_column :comments, :parent_id, :integer
  end
end
