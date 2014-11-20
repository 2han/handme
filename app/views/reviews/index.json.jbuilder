json.array!(@reviews) do |review|
  json.extract! review, :from_user_id, :to_user_id, :score
  json.url review_url(review, format: :json)
end