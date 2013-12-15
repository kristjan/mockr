json.array!(@mocks) do |mock|
  json.extract! mock, :id, :creator_id, :image
  json.url mock_url(mock, format: :json)
end
