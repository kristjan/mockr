require 'spec_helper'

describe "mocks/new" do
  before(:each) do
    assign(:mock, stub_model(Mock,
      :creator_id => 1,
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new mock form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mocks_path, "post" do
      assert_select "input#mock_creator_id[name=?]", "mock[creator_id]"
      assert_select "input#mock_url[name=?]", "mock[url]"
    end
  end
end
