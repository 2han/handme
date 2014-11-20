json.array!(@jobs) do |job|
  json.extract! job, :status, :fee, :user_id, :title, :introduction, :deadline, :place
  json.url job_url(job, format: :json)
end