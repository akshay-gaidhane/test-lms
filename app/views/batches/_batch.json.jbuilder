json.extract! batch, :id, :name, :start_time, :end_time, :every_day, :course_id, :user_id, :created_at, :updated_at
json.url batch_url(batch, format: :json)
