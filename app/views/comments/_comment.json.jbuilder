json.extract! comment, :id, :comment, :user_id, :post_id, :created_at, :updated_at, :user
json.user user
json.url comment_url(comment, format: :json)
