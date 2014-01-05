shared_examples 'a mock list' do
  it 'links to the mock' do
    render

    mocks.each do |mock|
      assert_select 'a[href=?]', mock_path(mock)
    end
  end

  it 'shows the image' do
    render

    mocks.each do |mock|
      assert_select 'a img[src=?]', mock.image
    end
  end
end
