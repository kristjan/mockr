require 'spec_helper'

describe "mocks/show" do
  let!(:mock) { assign(:mock, create(:mock)) }
  let!(:comment) { assign(:comment, build(:comment, mock: mock)) }

  it "renders attributes" do
    render

    rendered.should include(mock.creator.email)
    rendered.should include(mock.image.url)
  end
end
