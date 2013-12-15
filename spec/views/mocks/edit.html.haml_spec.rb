require 'spec_helper'

describe "mocks/edit" do
  before(:each) do
    @mock = assign(:mock, stub_model(Mock,
      :creator_id => 1,
      :url => "MyString"
    ))
  end

  it "renders the edit mock form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mock_path(@mock), "post" do
      assert_select "input#mock_creator_id[name=?]", "mock[creator_id]"
      assert_select "input#mock_url[name=?]", "mock[url]"
    end
  end
end
