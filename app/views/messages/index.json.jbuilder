json.array!(@messages) do |message|
  json.extract! message, :from_user_id, :to_user_id, :text, :job_id
  json.url message_url(message, format: :json)
end