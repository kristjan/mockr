require 'spec_helper'

describe "comments/show" do
  let!(:comment) { assign(:comment, create(:comment)) }

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should include(comment.author_id.to_s)
    rendered.should include(comment.mock_id.to_s)
    rendered.should include(comment.body)
  end
end
