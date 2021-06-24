json.extract! comment, :id, :body, :parent_id, :blog_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
