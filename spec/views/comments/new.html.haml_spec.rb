require 'spec_helper'

describe "comments/new" do
  let!(:comment) { assign(:comment, build(:comment)) }

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comments_path, "post" do
      assert_select "input#comment_author_id[name=?]", "comment[author_id]"
      assert_select "input#comment_mock_id[name=?]", "comment[mock_id]"
      assert_select "textarea#comment_body[name=?]", "comment[body]"
    end
  end
end
