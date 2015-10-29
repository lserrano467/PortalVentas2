json.array!(@users) do |user|
  json.extract! user, :id, :name, :lastName, :userName, :email, :phone, :userType
  json.url user_url(user, format: :json)
end
