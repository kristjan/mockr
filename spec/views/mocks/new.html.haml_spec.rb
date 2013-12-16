require 'spec_helper'

describe "mocks/new" do
  let!(:mock) { assign(:mock, build(:mock)) }

  it "renders new mock form" do
    render

    assert_select "form[action=?][method=?]", mocks_path, "post" do
      assert_select "input#mock_image[name=?]", "mock[image]"
    end
  end
end
