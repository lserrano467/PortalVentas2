json.array!(@features) do |feature|
  json.extract! feature, :id, :tittle, :price, :publicationDate, :, :publicationState, :
  json.url feature_url(feature, format: :json)
end
