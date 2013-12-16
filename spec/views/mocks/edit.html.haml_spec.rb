require 'spec_helper'

describe "mocks/edit" do
  let!(:mock) { assign(:mock, create(:mock)) }

  it "renders the edit mock form" do
    render

    assert_select "form[action=?][method=?]", mock_path(mock), "post" do
      assert_select "input#mock_image[name=?]", "mock[image]"
    end
  end
end
