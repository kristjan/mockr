describe 'home/index.html.haml' do
  let!(:mocks) do
    assign(:mocks, 2.times.map { create(:mock) })
  end

  it_behaves_like 'a mock list'
end
