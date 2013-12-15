json.array!(@mocks) do |mock|
  json.extract! mock, :id, :creator_id, :url
  json.url mock_url(mock, format: :json)
end
