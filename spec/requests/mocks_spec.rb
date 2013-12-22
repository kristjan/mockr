require 'spec_helper'

describe "Mocks" do
  describe "GET /mocks" do
    before(:each) do
      MocksController.any_instance.stubs(:authenticate_user!).
        returns(true)
    end
    
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get mocks_path
      response.status.should be(200)
    end
  end
end
