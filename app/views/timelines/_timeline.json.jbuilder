json.extract! timeline, :id, :title, :content, :image, :user_id, :created_at, :updated_at
json.url timeline_url(timeline, format: :json)
