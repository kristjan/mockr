require 'spec_helper'

describe "comments/edit" do
  let!(:comment) { assign(:comment, create(:comment)) }

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comment_path(comment), "post" do
      assert_select "input#comment_author_id[name=?]", "comment[author_id]"
      assert_select "input#comment_mock_id[name=?]", "comment[mock_id]"
      assert_select "textarea#comment_body[name=?]", "comment[body]"
    end
  end
end
