require 'spec_helper'

describe "Comments" do
  describe "GET /comments" do
    before(:each) do
      CommentsController.any_instance
        .stubs(:authenticate_user!)
        .returns(true)
      CommentsController.any_instance
        .stubs(:current_user)
        .returns(create(:user))
    end

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get comments_path
      response.status.should be(200)
    end
  end
end
