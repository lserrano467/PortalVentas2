json.array!(@notifications) do |notification|
  json.extract! notification, :id, :reason, :notificationDate
  json.url notification_url(notification, format: :json)
end
