json.array!(@post_categories) do |post_category|
  json.extract! post_category, :id, :title, :description, :slug
  json.url post_category_url(post_category, format: :json)
end
