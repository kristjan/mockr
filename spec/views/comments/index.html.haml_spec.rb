require 'spec_helper'

describe "comments/index" do
  let!(:comments) do
    assign(:comments, 2.times.map { create(:comment) } )
  end

  it "renders a list of comments" do
    render

    comments.each do |comment|
      assert_select "tr>td", :text => comment.author_id.to_s
      assert_select "tr>td", :text => comment.mock_id.to_s
      assert_select "tr>td", :text => comment.body
    end
  end
end
