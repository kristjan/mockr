require 'spec_helper'

describe "Organizations" do
  before(:each) do
    OrganizationsController.any_instance
      .stubs(:authenticate_user!)
      .returns(true)
    OrganizationsController.any_instance
      .stubs(:current_user)
      .returns(create(:user))
  end

  describe "GET /organizations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to us
      get organizations_path
      response.status.should be(200)
    end
  end
end
