json.array!(@applies) do |apply|
  json.extract! apply, :user_id, :job_id, :status
  json.url apply_url(apply, format: :json)
end