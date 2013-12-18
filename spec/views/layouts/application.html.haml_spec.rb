require 'spec_helper'

describe "layouts/application" do
  context "a signed in user" do
    before(:each) do
      controller.stubs(:user_signed_in?).returns(true)
      controller.stubs(:current_user).returns(create(:user))
    end
    
    it "should see the Upload Mock link" do
      render
      rendered.should include("Upload Mock")
    end
  end

  context "a signed out user" do
    before(:each) do
      controller.stubs(:user_signed_in?).returns(false)
      controller.stubs(:current_user).returns(nil)
    end
  
    it "should not see the Upload Mock link" do
      render
      rendered.should_not include("Upload Mock")
    end
    
    it "should see the Sign In link" do
      render
      rendered.should include("Sign in")
    end
    
    it "should see the Sign Up link" do
      render
      rendered.should include("Sign up")
    end
  end
end