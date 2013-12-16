require 'spec_helper'

describe "mocks/show" do
  let!(:mock) { assign(:mock, create(:mock)) }

  it "renders attributes in <p>" do
    render

    rendered.should include(mock.creator.email)
    rendered.should include(mock.image.url)
  end
end
