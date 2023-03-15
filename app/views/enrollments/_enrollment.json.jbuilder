json.extract! enrollment, :id, :sender_id, :batch_id, :monitored_by, :status, :created_at, :updated_at
json.url enrollment_url(enrollment, format: :json)
